class Question {
  final String question;
  final String author;
  final String recipient;
  final int timestamp;
  final String id;

  Question(
      {this.question, this.author, this.recipient, this.timestamp, this.id});

  factory Question.fromMap(Map<String, dynamic> data, String id) {
    if (data == null) {
      return null;
    }
    return Question(
        id: id,
        question: data["question"],
        author: data["auhtor"],
        recipient: data["recipient"],
        timestamp: data["timestamp"]);
  }
}
