import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../store/datagrid_store.dart';
import '../data_source/listing_datagridsrouce.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

class DataGridFilterWidget extends StatefulWidget {
  final mySubmitCell;
  final ListingDataGridSource dataGridSource;
  const DataGridFilterWidget(
      {Key? key, required this.mySubmitCell, required this.dataGridSource})
      : super(key: key);

  @override
  State<DataGridFilterWidget> createState() => _DataGridFilterWidgetState();
}

class _DataGridFilterWidgetState extends State<DataGridFilterWidget> {
  final _formKey = GlobalKey<FormBuilderState>();

  List dropOption = [
    "Node Js",
    "React JS",
    "Express JS",
    "Next JS",
    "Vue JS",
  ];

  void _onChanged(dynamic val) {
    List? data = Provider.of<DataGridStore>(context, listen: false).data;
    List? filterData = [];
    data?.forEach((element) {
      String name = element['name'] as String;
      String keyword = val as String;

      bool has =
          RegExp(RegExp.escape(keyword), caseSensitive: false).hasMatch(name);
      if (has) {
        filterData.add(element);
      }
    });

    widget.dataGridSource.buildDataGridRow('JSON', filterData);
    widget.dataGridSource.updateDataGridSource();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FormBuilder(
          key: _formKey,
          // autovalidate: true,
          child: Column(
            children: <Widget>[
              // FormBuilderDropdown(
              //   name: 'name',
              //   decoration: InputDecoration(
              //     labelText: 'Name',
              //   ),
              //   // initialValue: 'Male',
              //   allowClear: true,
              //   hint: Text('Name'),
              //   // validator: FormBuilderValidators.compose(
              //   //     [FormBuilderValidators.required(context)]),
              //   items: dropOption
              //       .map((option) => DropdownMenuItem(
              //             value: option,
              //             child: Text('$option'),
              //           ))
              //       .toList(),
              // ),
              FormBuilderTextField(
                name: 'name',
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                onChanged: _onChanged,
                // valueTransformer: (text) => num.tryParse(text),
                // validator: FormBuilderValidators.compose([
                //   FormBuilderValidators.required(context),
                //   FormBuilderValidators.numeric(context),
                //   FormBuilderValidators.max(context, 70),
                // ]),
                keyboardType: TextInputType.name,
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
                    print(Provider.of<DataGridStore>(context, listen: false)
                        .data);
                    // // print(_formKey.currentState?.value);
                    // // Make API call to supbase
                    // Map value = _formKey.currentState?.value as Map;
                    // List skills = widget.data;
                    // List mySkills = [];

                    // bool found = false;
                    // skills.forEach((m) {
                    //   if (m['env'] == value['env']) {
                    //     found = true;
                    //     mySkills.add(value);
                    //   } else {
                    //     mySkills.add(m);
                    //   }
                    // });

                    // if (found == false) {
                    //   mySkills.add(value);
                    // }

                    // // skills.add(value);
                    // // print("----$mySkills");

                    // widget.mySubmitCell(mySkills);
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
