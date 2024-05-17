import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banned Words Checker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _newWordController = TextEditingController(); // Controller for new word input
  List<String> _wordList = [];
  List<String> _reportedWordList = [];
  List<String> _foundWords = [];
  bool _isLoading = true;
  bool _isReportedListLoading = true;

  @override
  void initState() {
    super.initState();
     _fetchWords();
     _fetchReportedWords();
  }

  Future<void> _fetchWords() async {
    try {
      CollectionReference wordsCollection = FirebaseFirestore.instance.collection('tiktok_banned_list');
      DocumentSnapshot snapshot = await wordsCollection.doc('cftpk1jkZtLMAikUxXCC').get();

      if (snapshot.exists) {
        setState(() {
          _wordList = List<String>.from(snapshot['official_banned_words_list']);
          _isLoading = false;
        });
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print(e);
    }
  }

  Future<void> _fetchReportedWords() async {
    try {
      CollectionReference wordsCollection = FirebaseFirestore.instance.collection('tiktok_banned_list');
      DocumentSnapshot snapshot = await wordsCollection.doc('1OvoCJXkal45ygIJWcc0').get();

      if (snapshot.exists) {
        setState(() {
          _reportedWordList = List<String>.from(snapshot['reported_words_list']);
          _isReportedListLoading = false;
        });
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      setState(() {
        _isReportedListLoading = false;
      });
      print(e);
    }
  }

  List<String> removeDuplicates(List<String> list) {
    // Convert the list to a set to remove duplicates
    Set<String> uniqueSet = list.toSet();

    // Convert the set back to a list
    List<String> uniqueList = uniqueSet.toList();

    return uniqueList;
  }

  Future<void> saveWordsToFirestoreReportedList(List<String> words) async {

    CollectionReference wordsCollection = FirebaseFirestore.instance.collection('tiktok_banned_list');
    await wordsCollection.doc('1OvoCJXkal45ygIJWcc0').set({
      'reported_words_list': words,
    });
  }

  Future<void> saveWordsToFirestoreOfficialList(List<String> words) async {

    CollectionReference wordsCollection = FirebaseFirestore.instance.collection('tiktok_banned_list');
    await wordsCollection.doc('cftpk1jkZtLMAikUxXCC').set({
      'official_banned_words_list': words,
    });
  }

  Future<bool> isWordAppearingANumberOfTimeInReportedList(String wordToCheck, int appearingTime) async {
    try {
      // Replace 'your_collection' with your Firestore collection name
      // and 'your_document' with your document ID
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('tiktok_banned_list').doc('1OvoCJXkal45ygIJWcc0').get();

      // Assuming your list is stored under a field named 'wordList'
      List<dynamic> wordList = snapshot.get('reported_words_list');

      // Count the occurrences of the wordToCheck in the wordList
      int wordCount = wordList.where((word) => word == wordToCheck).length;

      // Check if the word appears more than 3 times
      return wordCount > appearingTime;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<void> _addNewWord() async {
    String newWord = _newWordController.text.trim();
    if (newWord.isNotEmpty) {

      bool shouldBeAddToOfficialList = await isWordAppearingANumberOfTimeInReportedList(newWord, 2);
      if (shouldBeAddToOfficialList){
        setState(() {
          _wordList.add(newWord);
        });
        _wordList = removeDuplicates(_wordList);
        await saveWordsToFirestoreOfficialList(_wordList);
      }
      else {
        setState(() {
          _reportedWordList.add(newWord);
        });
        await saveWordsToFirestoreReportedList(_reportedWordList);
      }
      _newWordController.clear();
    }
  }

  void _checkWords() {
    String paragraph = _controller.text.toLowerCase();
    List<String> foundWords = [];
    for (String word in _wordList) {
      if (paragraph.contains(word.toLowerCase())) {
        foundWords.add(word);
      }
    }
    setState(() {
      _foundWords = foundWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    final time = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiktok Banned Words Checker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Text('Check if your paragraph have banned word from Tiktok that can potentially reduce your viewers', style: Theme.of(context).textTheme.titleMedium,),
            SizedBox(height: 16.0),
            if (_wordList.isNotEmpty)
              Text(
                'Total words in the banned list: ${_wordList.length} (${time.day}-${time.month}-${time.year})',
              ),
            SizedBox(height: 16.0),
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else
              Expanded(
                child: SingleChildScrollView(
                  child: TextField(
                    controller: _controller,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter the paragraph you want to check here',
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 16.0),
            FilledButton(
              onPressed: _checkWords,
              child: const Text('Check Words'),
            ),
            const SizedBox(height: 16.0),
            if (_foundWords.isNotEmpty) ...[
              const Text(
                'Found words:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Wrap(
                spacing: 8.0,
                children: _foundWords.map((word) => Chip(label: Text(word))).toList(),
              ),

            ],
            Divider(),
            Text('Help us improve the app by report new words', style: Theme.of(context).textTheme.titleMedium,),
            SizedBox(height: 16.0),
            TextField(
              controller: _newWordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a new word to add',
              ),
            ),
            SizedBox(height: 16.0),
            FilledButton(
              onPressed: _addNewWord,
              child: Text('Report word'),
            ),
          ],
        ),
      ),
    );
  }
}
