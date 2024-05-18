import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDataHandler{
  static Future<void> saveWordsToFirestoreOfficialList(List<String> words) async {

    CollectionReference wordsCollection = FirebaseFirestore.instance.collection('tiktok_banned_list');
    await wordsCollection.doc('cftpk1jkZtLMAikUxXCC').set({
      'official_banned_words_list': words,
    });
  }

  static Future<void> saveWordsToFirestoreReportedList(List<String> words) async {

    CollectionReference wordsCollection = FirebaseFirestore.instance.collection('tiktok_banned_list');
    await wordsCollection.doc('1OvoCJXkal45ygIJWcc0').set({
      'reported_words_list': words,
    });
  }

}