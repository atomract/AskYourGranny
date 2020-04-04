// Firebase App (the core Firebase SDK) is always required and must be listed first
import app from 'firebase/app';
import 'firebase/auth';
import 'firebase/firestore';

var firebaseConfig = {
  apiKey: 'AIzaSyBnQ2ZdDC5mDT2Y_moqcLtjOfiZ29BOXRE',
  authDomain: 'helpingvulnerablepeople-8e593.firebaseapp.com',
  databaseURL: 'https://helpingvulnerablepeople-8e593.firebaseio.com',
  projectId: 'helpingvulnerablepeople-8e593',
  storageBucket: 'helpingvulnerablepeople-8e593.appspot.com',
  messagingSenderId: '998962966751',
  appId: '1:998962966751:web:1c16e00719b9e2c2a4f96a'
};

class Firebase {
  auth: firebase.auth.Auth;
  db: firebase.firestore.Firestore;

  constructor() {
    app.initializeApp(firebaseConfig);

    this.auth = app.auth();
    this.db = app.firestore();
  }

  public async addQuestion(questionBody: string = 'Que pasa?') {
    this.db.collection('questions').add({
      question: questionBody,
      author: '1BmC5br0yhMbWinjZVZUMLZFgS82', // Max Musteman UID
      recipient: '88ntWuMCUdhgZUWDzcbcE89Xd9s1', // Test3 UID
      timestamp: Date.now(),
      status: 'new'
    });
  }
}
export default Firebase;
