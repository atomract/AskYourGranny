import 'package:flutter/material.dart';
import 'package:mobile_client/models/question.dart';
import 'package:mobile_client/services/firebase/firestore_service.dart';
import 'package:provider/provider.dart';

class AnswerQuestionPage extends StatelessWidget {
  final Question question;
  const AnswerQuestionPage({Key key, this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Answer Question"),
      ),
      body: Padding(
          padding: EdgeInsets.only(bottom: 25, left: 5, right: 5),
          child: AnswerQuestionWidget(
            question: this.question,
          )),
    );
  }
}

class AnswerQuestionWidget extends StatefulWidget {
  final Question question;
  AnswerQuestionWidget({Key key, this.question}) : super(key: key);

  @override
  _AnswerQuestionWidgetState createState() => _AnswerQuestionWidgetState();
}

class _AnswerQuestionWidgetState extends State<AnswerQuestionWidget> {
  String _answer;
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<FirestoreService>(context);
    return SingleChildScrollView(
        child: SizedBox(
      height: MediaQuery.of(context).size.height -
          Scaffold.of(context).appBarMaxHeight -
          25,
      child: Column(
        children: <Widget>[
          Text(
            widget.question.question,
            style: TextStyle(
              fontSize: 55,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: TextField(
              expands: true,
              maxLines: null,
              onChanged: (value) => _answer = value,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Enter your answer"),
              style: TextStyle(fontSize: 35),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            width: double.infinity,
            height: 150,
            child: FlatButton(
                onPressed: () async {
                  database
                      .answerQuestion(
                          answer: _answer, question: widget.question)
                      .then((_) {
                    Navigator.pop(context);
                  });
                },
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  "Answer",
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
                onPressed: () async {
                  database.declineQuestion(question: widget.question).then((_) {
                    Navigator.pop(context);
                  });
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
          ),
        ],
      ),
    ));
  }
}
