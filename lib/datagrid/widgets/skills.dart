import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

class SkillsWidget extends StatefulWidget {
  final List skillList;
  const SkillsWidget({Key? key, required this.skillList}) : super(key: key);

  @override
  State<SkillsWidget> createState() => _SkillsWidgetState();
}

class _SkillsWidgetState extends State<SkillsWidget> {
  final _formKey = GlobalKey<FormBuilderState>();

  List dropOption = [
    "Node Js",
    "React JS",
    "Express JS",
    "Next JS",
    "Vue JS",
    "Angular",
    "Typescript",
    "Dot net",
    "PHP",
    "HTML",
    "CSS",
    "C#",
    "C",
    "Spring",
    "Springboot",
    "Django",
    "Flask",
    "React native",
    "Kotlin",
    "Flutter",
    "System Architecture",
    "Low level design",
    "High level design",
    "AWS",
    "Azure",
    "GCP",
    "Jenkins",
    "Selenium",
    "Linux",
    "Kafka",
    "SQL",
    "No SQL",
    "Mongo DB"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FormBuilder(
          key: _formKey,
          // autovalidate: true,
          child: Column(
            children: <Widget>[
              FormBuilderDropdown(
                name: 'env',
                decoration: InputDecoration(
                  labelText: 'Framework',
                ),
                // initialValue: 'Male',
                allowClear: true,
                hint: Text('Select Framework'),
                // validator: FormBuilderValidators.compose(
                //     [FormBuilderValidators.required(context)]),
                items: dropOption
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text('$option'),
                        ))
                    .toList(),
              ),
              FormBuilderTextField(
                name: 'exp',
                decoration: InputDecoration(
                  labelText: 'Experience',
                ),
                // onChanged: _onChanged,
                // valueTransformer: (text) => num.tryParse(text),
                // validator: FormBuilderValidators.compose([
                //   FormBuilderValidators.required(context),
                //   FormBuilderValidators.numeric(context),
                //   FormBuilderValidators.max(context, 70),
                // ]),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: <Widget>[
            Expanded(
              child: MaterialButton(
                color: Theme.of(context).colorScheme.secondary,
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _formKey.currentState?.save();

                  if (_formKey.currentState!.validate()) {
                    print(_formKey.currentState?.value);
                    // Make API call to supbase

                  } else {
                    print("validation failed");
                  }
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
