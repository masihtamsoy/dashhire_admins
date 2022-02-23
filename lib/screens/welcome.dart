import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Welcome Dash admins'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/is');
                },
                child: Text("Internal Sheet",
                    style: const TextStyle(fontSize: 20))),
            SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/upload_file');
                },
                child:
                    Text("Upload Sheets", style: const TextStyle(fontSize: 20)))
          ]),
        ));
  }
}
