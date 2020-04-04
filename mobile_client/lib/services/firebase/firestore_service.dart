import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_client/models/question.dart';

class FirestoreService {
  FirestoreService({@required this.uid}) : assert(uid != null);
  final String uid;

  Stream<List<Question>> questionStream() {
    var ref = Firestore.instance
        .collection("questions")
        .where("status", isEqualTo: "new")
        .where("recipient", isEqualTo: uid);
    return ref.snapshots().map((list) => list.documents
        .map((doc) => Question.fromMap(doc.data, doc.documentID))
        .toList());
  }

  Future<DocumentReference> createQuestion(
      {String question, String auhtor, String recipient, DateTime timestamp}) {
    var ref = Firestore.instance.collection("questions");
    return ref.add({
      "question": question,
      "auhtor": auhtor,
      "recipient": recipient,
      "timestamp": timestamp
    });
  }

  Future answerQuestion({String answer, Question question}) {
    return Firestore.instance
        .collection("questions")
        .document(question.id)
        .updateData({"answer": answer, "status": "answered"});
  }

  Future declineQuestion({Question question}) {
    return Firestore.instance
        .collection("questions")
        .document(question.id)
        .updateData({"status": "declined"});
  }
}
