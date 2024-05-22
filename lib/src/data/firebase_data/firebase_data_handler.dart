import 'package:banned_words_checker/src/core/constants/tiktok_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDataHandler{
  static Future<void> saveWordsToFirestoreOfficialList(List<String> words) async {

    CollectionReference wordsCollection = FirebaseFirestore.instance.collection('tiktok_banned_list');
    await wordsCollection.doc(TiktokConstants.firebaseOfficialDocumentName).set({
      TiktokConstants.firebaseOfficialList: words,
    });
  }

  static Future<void> saveWordsToFirestoreReportedList(List<String> words) async {

    CollectionReference wordsCollection = FirebaseFirestore.instance.collection('tiktok_banned_list');
    await wordsCollection.doc(TiktokConstants.firebaseReportedDocumentName).set({
      TiktokConstants.firebaseReportedList: words,
    });
  }

  static Future<void> addNewVisitor(int currentValue) async {

    CollectionReference wordsCollection = FirebaseFirestore.instance.collection('tiktok_banned_list');
    await wordsCollection.doc(TiktokConstants.firebaseStatisticDocumentName).set({
      TiktokConstants.firebaseVisitorsNumber: currentValue,
    });
  }

}