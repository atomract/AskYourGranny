import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_client/services/firebase/firebase_auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Sign in"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInPage()));
                },
              ),
              RaisedButton(
                child: Text("Create new account"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateAccountPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (context) {
      return SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
            return null;
          },
          child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(20.0),
                child: Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      SizedBox(height: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'Sign in to an existing account',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                              onSaved: (value) => _email = value,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(labelText: "E-Mail")),
                          TextFormField(
                              onSaved: (value) => _password = value,
                              obscureText: true,
                              decoration:
                                  InputDecoration(labelText: "Password")),
                          SizedBox(height: 20.0),
                          RaisedButton(
                            child: Text("Login"),
                            onPressed: () async {
                              // save the fields..
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text("Authenticating..."),
                              ));
                              final form = _formKey.currentState;
                              form.save();
                              User result =
                                  await Provider.of<FirebaseAuthService>(
                                          context,
                                          listen: false)
                                      .signInWithEmailAndPassword(
                                          email: _email, password: _password);
                              print(result);
                              if (form.validate()) {
                                try {} on AuthException catch (error) {
                                  print(error);
                                } on Exception catch (error) {
                                  print(error);
                                }
                              }
                            },
                          )
                        ],
                      ),
                      SizedBox(height: 20.0),
                    ]))),
          ),
        ),
      );
    }));
  }
}

class CreateAccountPage extends StatefulWidget {
  CreateAccountPage({Key key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (context) {
      return SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
            return null;
          },
          child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(20.0),
                child: Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      SizedBox(height: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'Create an Account',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                              onSaved: (value) => _email = value,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(labelText: "E-Mail")),
                          TextFormField(
                              onSaved: (value) => _password = value,
                              obscureText: true,
                              decoration:
                                  InputDecoration(labelText: "Password")),
                          SizedBox(height: 20.0),
                          RaisedButton(
                            child: Text("Login"),
                            onPressed: () async {
                              // save the fields..
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text("Authenticating..."),
                              ));
                              final form = _formKey.currentState;
                              form.save();
                              User result =
                                  await Provider.of<FirebaseAuthService>(
                                          context,
                                          listen: false)
                                      .createUserWithEmailAndPassword(
                                          email: _email, password: _password);
                              print(result);
                              if (form.validate()) {
                                try {} on AuthException catch (error) {
                                  print(error);
                                } on Exception catch (error) {
                                  print(error);
                                }
                              }
                            },
                          )
                        ],
                      ),
                      SizedBox(height: 20.0),
                    ]))),
          ),
        ),
      );
    }));
  }
}
