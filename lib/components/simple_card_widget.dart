import 'package:flutter/material.dart';

class SimpleCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String answers;
  final String onboarding;
  final String totalScore;
  final VoidCallback? onPressed;

  const SimpleCardWidget(
      {Key? key,
      this.onPressed,
      this.title = "",
      this.subtitle = "",
      this.answers = "",
      this.onboarding = "",
      this.totalScore = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 8),
        child: Card(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(title),
                subtitle: Text(subtitle),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(totalScore),
                  const SizedBox(height: 10),
                  Text(answers),
                  const SizedBox(height: 10),
                  Text(onboarding),

                  /// Add condition
                  MaterialButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: onPressed,
                    child: const Text(
                      'Click',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}
