import 'package:flutter/material.dart';
import 'package:mobile_client/models/question.dart';
import 'package:mobile_client/pages/answerQuestionPage.dart';
import 'package:mobile_client/services/firebase/firestore_service.dart';
import 'package:provider/provider.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
  const QuestionWidget({
    Key key,
    this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<FirestoreService>(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 25, left: 5, right: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            question.question,
            style: TextStyle(
              fontSize: 55,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 150,
                child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnswerQuestionPage(
                                    question: question,
                                  )));
                    },
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      "Accept",
                      style: TextStyle(
                          fontSize: 65,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                height: 150,
                child: FlatButton(
                    onPressed: () {
                      database.declineQuestion(question: question);
                    },
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      "Decline",
                      style: TextStyle(
                          fontSize: 65,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
