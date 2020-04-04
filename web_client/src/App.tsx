import React from 'react';
import logo from './logo.svg';
import { BrowserRouter, Route, Switch } from 'react-router-dom';
import ControlPanel from './pages/ControlPanel';
import SendNotification from './pages/SendNotification';
import WriteQuestion from './pages/WriteQuestion';
import Firebase from './services/firebase';
import FirebaseContext from './utils/withFirebase';
import './App.css';
import Login from './pages/Login';

function App() {
  return (
    <FirebaseContext.Provider value={new Firebase()}>
      <BrowserRouter>
        <Switch>
          <Route path="/" component={ControlPanel} exact />
          <Route path="/login" component={Login} exact />
          <Route path="/send-notification" component={SendNotification} exact />
          <Route path="/write-question" component={WriteQuestion} exact />
        </Switch>
      </BrowserRouter>
    </FirebaseContext.Provider>
  );
}

export default App;
