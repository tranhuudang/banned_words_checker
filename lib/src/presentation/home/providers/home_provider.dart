import 'package:banned_words_checker/src/core/utils/debug_log.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:banned_words_checker/src/core/constants/tiktok_constants.dart';
import 'package:banned_words_checker/src/data/firebase_data/firebase_data_handler.dart';

import 'home_props.dart';

class HomePropsNotifier extends StateNotifier<HomeProps> {
  HomePropsNotifier() : super(HomeProps()) {
    fetchWords();
    fetchReportedWords();
    fetchNumberOfVisitor();
  }

  Future<void> fetchWords() async {
    try {
      CollectionReference wordsCollection = FirebaseFirestore.instance
          .collection(TiktokConstants.firebaseCollectionName);
      DocumentSnapshot snapshot = await wordsCollection
          .doc(TiktokConstants.firebaseOfficialDocumentName)
          .get();
      if (snapshot.exists) {
        state = state.copyWith(
          wordList:
              List<String>.from(snapshot[TiktokConstants.firebaseOfficialList]),
          isLoading: false,
        );
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
      DebugLog.error('$e');
    }
  }

  Future<void> fetchReportedWords() async {
    try {
      CollectionReference wordsCollection = FirebaseFirestore.instance
          .collection(TiktokConstants.firebaseCollectionName);
      DocumentSnapshot snapshot = await wordsCollection
          .doc(TiktokConstants.firebaseReportedDocumentName)
          .get();
      if (snapshot.exists) {
        state = state.copyWith(
          reportedWordList:
              List<String>.from(snapshot[TiktokConstants.firebaseReportedList]),
          isReportedListLoading: false,
        );
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      state = state.copyWith(isReportedListLoading: false);
      DebugLog.error('$e');
    }
  }

  Future<void> fetchNumberOfVisitor() async {
    try {
      CollectionReference wordsCollection = FirebaseFirestore.instance
          .collection(TiktokConstants.firebaseCollectionName);
      DocumentSnapshot snapshot = await wordsCollection
          .doc(TiktokConstants.firebaseStatisticDocumentName)
          .get();
      if (snapshot.exists) {
        int numberOfVisitor = snapshot[TiktokConstants.firebaseVisitorsNumber];
        state = state.copyWith(
          numberOfVisitor: numberOfVisitor,
          isNumberOfVisitorLoading: false,
        );
        await FirebaseDataHandler.addNewVisitor(numberOfVisitor + 1);
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      state = state.copyWith(isNumberOfVisitorLoading: false);
      DebugLog.error('$e');
    }
  }

  Future<void> addNewWord(String newWord, String reporter) async {
    if (newWord.isNotEmpty) {
      bool shouldBeAddToOfficialList =
          await isWordAppearingANumberOfTimeInReportedList(newWord, 2);
      if (shouldBeAddToOfficialList || reporter == 'reporter') {
        List<String> updatedWordList = List.from(state.wordList)..add(newWord);
        updatedWordList = updatedWordList.toSet().toList(); // remove duplicates
        state = state.copyWith(wordList: updatedWordList);
        await FirebaseDataHandler.saveWordsToFirestoreOfficialList(
            updatedWordList);
      } else {
        List<String> updatedReportedWordList = List.from(state.reportedWordList)
          ..add(newWord);
        state = state.copyWith(reportedWordList: updatedReportedWordList);
        await FirebaseDataHandler.saveWordsToFirestoreReportedList(
            updatedReportedWordList);
      }
      state = state.copyWith(isReported: true);
    }
  }

  Future<bool> isWordAppearingANumberOfTimeInReportedList(
      String wordToCheck, int appearingTime) async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection(TiktokConstants.firebaseCollectionName)
          .doc(TiktokConstants.firebaseReportedDocumentName)
          .get();
      List<dynamic> wordList =
          snapshot.get(TiktokConstants.firebaseReportedList);
      int wordCount = wordList.where((word) => word == wordToCheck).length;
      return wordCount > appearingTime;
    } catch (e) {
      DebugLog.error('$e');
      return false;
    }
  }

  void checkWords(String paragraph) {
    List<String> foundWords = [];
    for (String word in state.wordList) {
      if (paragraph.contains(' ${word.toLowerCase()} ') ||
          paragraph.contains(' ${word.toLowerCase()}') ||
          paragraph.contains('${word.toLowerCase()} ') ||
          paragraph.contains(word.toLowerCase()) &&
              paragraph.length == word.length) {
        foundWords.add(word);
      }
    }
    state = state.copyWith(foundWords: foundWords);
  }
}

final homePropsProvider =
    StateNotifierProvider<HomePropsNotifier, HomeProps>((ref) {
  return HomePropsNotifier();
});
