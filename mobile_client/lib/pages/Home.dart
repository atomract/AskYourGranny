import 'package:flutter/material.dart';
import 'package:mobile_client/models/question.dart';
import 'package:mobile_client/services/firebase/firebase_auth_service.dart';
import 'package:mobile_client/services/firebase/firestore_service.dart';
import 'package:mobile_client/widgets/questionWidget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<FirestoreService>(context);
    final auth = Provider.of<FirebaseAuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          GestureDetector(
            child: Icon(Icons.exit_to_app),
            onTap: () {
              auth.signOut();
            },
          )
        ],
      ),
      body: StreamProvider.value(
        value: database.questionStream(),
        child: QuestionList(),
      ),
    );
  }
}

class QuestionList extends StatelessWidget {
  const QuestionList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var questions = Provider.of<List<Question>>(context);
    if (questions != null) {
      return Container(
          child: questions.length > 0
              ? QuestionWidget(
                  question: questions[0],
                )
              : Padding(
                  padding: EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      "You are currently waiting for messages, soon they will be comming",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                  ),
                ));
    } else {
      return SizedBox();
    }
  }
}
