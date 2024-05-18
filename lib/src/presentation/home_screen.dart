import 'package:banned_words_checker/src/core/extentions/language_extension.dart';
import 'package:banned_words_checker/src/core/extentions/number_extenstion.dart';
import 'package:banned_words_checker/src/core/utils/helper.dart';
import 'package:banned_words_checker/src/data/firebase_data/firebase_data_handler.dart';
import 'package:banned_words_checker/src/data/local_data/tiktik_blocked_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_extension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _newWordController =
      TextEditingController(); // Controller for new word input
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
      CollectionReference wordsCollection =
          FirebaseFirestore.instance.collection('tiktok_banned_list');
      DocumentSnapshot snapshot =
          await wordsCollection.doc('cftpk1jkZtLMAikUxXCC').get();

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
      CollectionReference wordsCollection =
          FirebaseFirestore.instance.collection('tiktok_banned_list');
      DocumentSnapshot snapshot =
          await wordsCollection.doc('1OvoCJXkal45ygIJWcc0').get();

      if (snapshot.exists) {
        setState(() {
          _reportedWordList =
              List<String>.from(snapshot['reported_words_list']);
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

  Future<bool> isWordAppearingANumberOfTimeInReportedList(
      String wordToCheck, int appearingTime) async {
    try {
      // Replace 'your_collection' with your Firestore collection name
      // and 'your_document' with your document ID
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('tiktok_banned_list')
          .doc('1OvoCJXkal45ygIJWcc0')
          .get();

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
      bool shouldBeAddToOfficialList =
          await isWordAppearingANumberOfTimeInReportedList(newWord, 2);
      if (shouldBeAddToOfficialList) {
        _wordList += tiktokBlockedWords;
        setState(() {
          _wordList.add(newWord);
        });
        _wordList = removeDuplicates(_wordList);
        await FirebaseDataHandler.saveWordsToFirestoreOfficialList(_wordList);
      } else {
        setState(() {
          _reportedWordList.add(newWord);
        });
        await FirebaseDataHandler.saveWordsToFirestoreReportedList(
            _reportedWordList);
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
        scrolledUnderElevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/icon.png',
              height: 35,
              width: 35,
            ),
            8.width,
             Text('Banned Words Checker'.i18n),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('${'Language'.i18n}: '),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: I18n.of(context).locale.languageCode,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          I18n.of(context).locale = newValue.toLocale();
                        }
                      },
                      items: <String>['en', 'vi'] // Add more languages as needed
                          .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value.i18n),
                        ),
                      )
                          .toList(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('${'Platform'.i18n}: '),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: 'Tiktok',
                      onChanged: (String? newValue) {

                      },
                      items: <String>['Tiktok'] // Add more languages as needed
                          .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                          .toList(),
                    ),
                  ),
                ],
              ),
              16.height,
              Text(
                'Check if your paragraph contains any banned words from TikTok that could potentially reduce your viewership.'.i18n,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              16.height,
              if (_wordList.isNotEmpty)
                Text(
                  '${'Total words in the banned list'.i18n}: ${_wordList.length} (${time.day}-${time.month}-${time.year})',
                ),
              16.height,
              if (_isLoading)
                const Center(child: CircularProgressIndicator())
              else
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _controller,
                        maxLines: null,
                        decoration:  InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Enter the paragraph you want to check here'.i18n,
                        ),
                      ),
                      16.height,
                      FilledButton(
                        onPressed: _checkWords,
                        child:  Text('Check Words'.i18n),
                      ),
                    ],
                  ),
                ),
        
              const SizedBox(height: 16.0),
              if (_foundWords.isNotEmpty) ...[
                 Text(
                  '${'Found words'.i18n}: ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Wrap(
                  spacing: 8.0,
                  children:
                      _foundWords.map((word) => Chip(label: Text(word))).toList(),
                ),
              ],
              const Divider(),
              Text(
                'Help us improve the app by report new words'.i18n,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              16.height,
              TextField(
                controller: _newWordController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter a new word to add'.i18n,
                ),
                onSubmitted: (String value) {
                  _addNewWord();
                },
              ),
              16.height,
              FilledButton(
                onPressed: _addNewWord,
                child: Text('Report word'.i18n),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
