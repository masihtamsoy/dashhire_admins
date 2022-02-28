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

  List dropOption = ["yes", "no"];

  void _onChangedVerified(dynamic val) {
    List? filterData = [];
    if (val == null || val == "") {
      // Make api call to update data from server
      Provider.of<DataGridStore>(context, listen: false)
          .generateData('candidates_final');
    } else {
      List? data = Provider.of<DataGridStore>(context, listen: false).data;
      data?.forEach((element) {
        if (element['verified'] != null) {
          String name = element['verified'] as String;
          String keyword = val as String;

          bool has = RegExp(RegExp.escape(keyword), caseSensitive: false)
              .hasMatch(name);
          if (has) {
            filterData.add(element);
          }
        }
      });

      /// verified set filterData, find name from filterData
      Provider.of<DataGridStore>(context, listen: false)
          .setFilterData(filterData);
    }

    widget.dataGridSource.buildDataGridRow('JSON', filterData);
    widget.dataGridSource.updateDataGridSource();
  }

  void _onChanged(dynamic val) {
    /// name filter; find from filterData
    List? data = Provider.of<DataGridStore>(context, listen: false).filterData;
    List? filterData = [];
    data?.forEach((element) {
      if (element['name'] != null) {
        String name = element['name'] as String;
        String keyword = val as String;

        bool has =
            RegExp(RegExp.escape(keyword), caseSensitive: false).hasMatch(name);
        if (has) {
          filterData.add(element);
        }
      }
    });

    widget.dataGridSource.buildDataGridRow('JSON', filterData);
    widget.dataGridSource.updateDataGridSource();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      child: FormBuilder(
        key: _formKey,
        // autovalidate: true,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 200,
                child: FormBuilderDropdown(
                  name: 'verifiedFilter',
                  decoration: InputDecoration(
                    labelText: 'Verified',
                  ),
                  // initialValue: 'Male',
                  allowClear: true,
                  onChanged: _onChangedVerified,
                  // hint: Text('Verified'),
                  // validator: FormBuilderValidators.compose(
                  //     [FormBuilderValidators.required(context)]),
                  items: dropOption
                      .map((option) => DropdownMenuItem(
                            value: option,
                            child: Text('$option'),
                          ))
                      .toList(),
                ),
              ),
              SizedBox(
                width: 20,
              ),

              SizedBox(
                width: 150,
                child: FormBuilderTextField(
                  name: 'nameFilter',

                  decoration: InputDecoration(
                      labelText: 'Name',
                      contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple))),
                  // s
                  onChanged: _onChanged,
                  // valueTransformer: (text) => num.tryParse(text),
                  // validator: FormBuilderValidators.compose([
                  //   FormBuilderValidators.required(context),
                  //   FormBuilderValidators.numeric(context),
                  //   FormBuilderValidators.max(context, 70),
                  // ]),
                  keyboardType: TextInputType.name,
                ),
              ),

              // SizedBox(
              //   child: MaterialButton(
              //     color: Theme.of(context).colorScheme.secondary,
              //     child: Text(
              //       "Submit",
              //       style: TextStyle(color: Colors.white),
              //     ),
              //     onPressed: () {
              //       _formKey.currentState?.save();
              //       if (_formKey.currentState!.validate()) {
              //         print(_formKey.currentState!.value);
              //         var nameFilter =
              //             _formKey.currentState!.value['nameFilter'];
              //         var verifiedFilter =
              //             _formKey.currentState!.value['verifiedFilter'];
              //       } else {
              //         print("validation failed");
              //       }
              //     },
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
