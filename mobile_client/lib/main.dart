import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_client/services/firebase/firebase_auth_service.dart';
import 'package:mobile_client/widgets/auth_widget.dart';
import 'package:mobile_client/widgets/auth_widget_builder.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthService>(
          create: (_) => FirebaseAuthService(),
        ),
      ],
      child: AuthWidgetBuilder(builder: (context, userSnapshot) {
        return MaterialApp(
          title: "Ask Granny",
          theme: ThemeData(primarySwatch: Colors.blue),
          home: AuthWidget(userSnapshot: userSnapshot),
        );
      }),
    );
  }
}
