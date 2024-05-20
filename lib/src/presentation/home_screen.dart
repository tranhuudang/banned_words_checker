import 'package:banned_words_checker/src/core/constants/tiktok_constants.dart';
import 'package:banned_words_checker/src/core/extentions/language_extension.dart';
import 'package:banned_words_checker/src/core/extentions/number_extenstion.dart';
import 'package:banned_words_checker/src/core/utils/helper.dart';
import 'package:banned_words_checker/src/data/firebase_data/firebase_data_handler.dart';
import 'package:banned_words_checker/src/data/local_data/tiktik_blocked_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wave_divider/wave_divider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _newWordController =
      TextEditingController(); // Controller for new word input
  List<String> _wordList = [];
  List<String> _reportedWordList = [];
  List<String> _foundWords = [];
  bool _isLoading = true;
  bool _isReportedListLoading = true;
  bool _isReported = false;

  @override
  void initState() {
    super.initState();
    _fetchWords();
    _fetchReportedWords();
  }

  Future<void> _fetchWords() async {
    try {
      CollectionReference wordsCollection = FirebaseFirestore.instance
          .collection(TiktokConstants.firebaseCollectionName);
      DocumentSnapshot snapshot = await wordsCollection
          .doc(TiktokConstants.firebaseOfficialDocumentName)
          .get();

      if (snapshot.exists) {
        setState(() {
          _wordList =
              List<String>.from(snapshot[TiktokConstants.firebaseOfficialList]);
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
      CollectionReference wordsCollection = FirebaseFirestore.instance
          .collection(TiktokConstants.firebaseCollectionName);
      DocumentSnapshot snapshot = await wordsCollection
          .doc(TiktokConstants.firebaseReportedDocumentName)
          .get();

      if (snapshot.exists) {
        setState(() {
          _reportedWordList =
              List<String>.from(snapshot[TiktokConstants.firebaseReportedList]);
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
          .collection(TiktokConstants.firebaseCollectionName)
          .doc(TiktokConstants.firebaseReportedDocumentName)
          .get();

      // Assuming your list is stored under a field named 'wordList'
      List<dynamic> wordList =
          snapshot.get(TiktokConstants.firebaseReportedList);

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
      if (shouldBeAddToOfficialList || _controller.text == 'reporter') {
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
      setState(() {
        _isReported = true;
      });
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
              Wrap(
                spacing: 32,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
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
                          items: <String>[
                            'en',
                            'vi'
                          ] // Add more languages as needed
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('${'Platform'.i18n}: '),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: 'Tiktok',
                          onChanged: (String? newValue) {},
                          items:
                              <String>['Tiktok'] // Add more languages as needed
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
                ],
              ),
              16.height,
              Text(
                'Check if your paragraph contains any banned words from TikTok that could potentially reduce your viewership.'
                    .i18n,
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
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText:
                              'Enter the paragraph you want to check here'.i18n,
                        ),
                      ),
                      16.height,
                      FilledButton(
                        onPressed: _checkWords,
                        child: Text('Check Words'.i18n),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 16.0),
              if (_foundWords.isNotEmpty) ...[
                Text(
                  '${'Found words that could potentially be banned from TikTok'.i18n}: ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Wrap(
                  spacing: 8.0,
                  children: _foundWords
                      .map((word) => Chip(label: Text(word)))
                      .toList(),
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
              if (_isReported)...[
              Text('We appreciate your contribution and commitment to making our platform better.'.i18n),
              16.height,
              ],
              FilledButton(
                onPressed: _addNewWord,
                child: Text('Report word'.i18n),
              ),
              16.height,
              WaveDivider(),
              16.height,
              // Center(
              //   child: Text(
              //     '© 2024 Tran Huu Dang. All rights reserved.',
              //     style: TextStyle(
              //       fontSize: 14.0,
              //       color: Colors.black,
              //     ),
              //   ),
              // ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(

            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(Icons.email, color: Colors.black),
                      SizedBox(width: 5.0),
                      TextButton(
                        onPressed: () => _launchURL('mailto:tranhuudang148@gmail.com'),
                        child: Text(
                          'tranhuudang148@gmail.com',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.phone, color: Colors.black),
                      SizedBox(width: 5.0),
                      TextButton(
                        onPressed: () => _launchURL('tel:+84843909394'),
                        child: Text(
                          '+84843909394',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.link, color: Colors.black),
                      SizedBox(width: 5.0),
                      TextButton(
                        onPressed: () => _launchURL('https://github.com/tranhuudang'),
                        child: Text(
                          'GitHub',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.link, color: Colors.black),
                      SizedBox(width: 5.0),
                      TextButton(
                        onPressed: () => _launchURL('https://www.tiktok.com/@gnaduuhnart'),
                        child: Text(
                          'TikTok',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              16.height,
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 150,
                      height: 200,
                      child: Image.asset(
                        'assets/TCB-QR-TRAN HUU DANG-20239171135.jpg', // Replace with your QR code image URL
              fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Donate to support the app',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          16.height,
          WaveDivider(),
          16.height,
          Center(
            child: Text(
              '© 2024 Tran Huu Dang. All rights reserved.',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}