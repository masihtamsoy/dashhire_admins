// import 'package:flutter/material.dart';
// import 'package:pluto_grid/pluto_grid.dart';
// import '../dummy_data/development.dart';

// class InternalSheet extends StatefulWidget {
//   InternalSheet({Key? key}) : super(key: key);

//   @override
//   State<InternalSheet> createState() => _InternalSheetState();
// }

// class _InternalSheetState extends State<InternalSheet> {
//   final List<PlutoColumn> columns = <PlutoColumn>[
//     PlutoColumn(
//       title: 'Date Added',
//       field: 'dateAdded',
//       type: PlutoColumnType.date(),
//     ),
//     PlutoColumn(
//       title: 'Name',
//       field: 'name',
//       type: PlutoColumnType.text(),
//     ),
//     PlutoColumn(
//       title: 'Location',
//       field: 'location',
//       type: PlutoColumnType.select(<String>[
//         'Delhi',
//         'Bangalore',
//         'Mumbai',
//         'Gurgaon',
//       ]),
//     ),
//     PlutoColumn(
//       title: 'Current Designation',
//       field: 'currentDesignation',
//       type: PlutoColumnType.text(),
//     ),
//     PlutoColumn(
//       title: 'Current Company',
//       field: 'currentCompany',
//       type: PlutoColumnType.text(),
//     ),
//     PlutoColumn(
//       title: 'Mobile',
//       field: 'mobile',
//       type: PlutoColumnType.text(),
//     ),
//     PlutoColumn(
//       title: 'Status',
//       field: 'status',
//       type: PlutoColumnType.select(<String>[
//         'Interested',
//         'Required JD',
//         'JD sent',
//         'Could not connect',
//         'Call later'
//       ]),
//     ),
//     PlutoColumn(
//       title: 'Id',
//       field: 'id',
//       type: PlutoColumnType.text(),
//     ),
//     PlutoColumn(
//       title: 'Age',
//       field: 'age',
//       type: PlutoColumnType.number(),
//     ),
//     PlutoColumn(
//       title: 'Role',
//       field: 'role',
//       type: PlutoColumnType.select(<String>[
//         'Programmer',
//         'Designer',
//         'Owner',
//       ]),
//     ),
//     PlutoColumn(
//       title: 'Joined',
//       field: 'joined',
//       type: PlutoColumnType.date(),
//     ),
//     PlutoColumn(
//       title: 'Working time',
//       field: 'working_time',
//       type: PlutoColumnType.time(),
//     ),
//   ];

//   final List<PlutoRow> rows = [
//     PlutoRow(
//       cells: {
//         'dateAdded': PlutoCell(value: '2021-01-01'),
//         'name': PlutoCell(value: 'Mike'),
//         'location': PlutoCell(value: 'Delhi'),
//         'currentDesignation': PlutoCell(value: 'Software Engineer'),
//         'currentCompany': PlutoCell(value: 'Google'),
//         'mobile': PlutoCell(value: '8011230915'),
//         'status': PlutoCell(value: 'Interested'),
//         'id': PlutoCell(value: 'user1'),
//         'age': PlutoCell(value: 20),
//         'role': PlutoCell(value: 'Programmer'),
//         'joined': PlutoCell(value: '2021-01-01'),
//         'working_time': PlutoCell(value: '09:00'),
//       },
//     ),
//     PlutoRow(
//       cells: {
//         'dateAdded': PlutoCell(value: '2021-01-01'),
//         'name': PlutoCell(value: 'Jack'),
//         'location': PlutoCell(value: 'Delhi'),
//         'currentDesignation': PlutoCell(value: 'Software Engineer'),
//         'currentCompany': PlutoCell(value: 'Google'),
//         'mobile': PlutoCell(value: '8011230915'),
//         'status': PlutoCell(value: 'Interested'),
//         'id': PlutoCell(value: 'user2'),
//         'age': PlutoCell(value: 25),
//         'role': PlutoCell(value: 'Designer'),
//         'joined': PlutoCell(value: '2021-02-01'),
//         'working_time': PlutoCell(value: '10:00'),
//       },
//     ),
//     PlutoRow(
//       cells: {
//         'dateAdded': PlutoCell(value: '2021-01-01'),
//         'name': PlutoCell(value: 'Suzi'),
//         'location': PlutoCell(value: 'Delhi'),
//         'currentDesignation': PlutoCell(value: 'Software Engineer'),
//         'currentCompany': PlutoCell(value: 'Google'),
//         'mobile': PlutoCell(value: '8011230915'),
//         'status': PlutoCell(value: 'Interested'),
//         'id': PlutoCell(value: 'user3'),
//         'age': PlutoCell(value: 40),
//         'role': PlutoCell(value: 'Owner'),
//         'joined': PlutoCell(value: '2021-03-01'),
//         'working_time': PlutoCell(value: '11:00'),
//       },
//     ),
//   ];

//   /// columnGroups that can group columns can be omitted.
//   final List<PlutoColumnGroup> columnGroups = [
//     PlutoColumnGroup(title: 'Id', fields: ['id'], expandedColumn: true),
//     PlutoColumnGroup(title: 'User information', fields: ['name', 'age']),
//     PlutoColumnGroup(title: 'Status', children: [
//       PlutoColumnGroup(title: 'A', fields: ['role'], expandedColumn: true),
//       PlutoColumnGroup(title: 'Etc.', fields: ['joined', 'working_time']),
//     ]),
//   ];

//   /// [PlutoGridStateManager] has many methods and properties to dynamically manipulate the grid.
//   /// You can manipulate the grid dynamically at runtime by passing this through the [onLoaded] callback.
//   late final PlutoGridStateManager stateManager;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.all(15),
//         child: PlutoGrid(
//           columns: columns,
//           rows: rows,
//           // columnGroups: columnGroups,

//           onLoaded: (PlutoGridOnLoadedEvent event) {
//             event.stateManager.setSelectingMode(PlutoGridSelectingMode.row);

//             stateManager = event.stateManager;
//           },
//           onChanged: (PlutoGridOnChangedEvent event) {
//             print(event);
//           },
//           configuration: const PlutoGridConfiguration(
//             enableColumnBorder: true,
//           ),
//         ),
//       ),
//     );
//   }
// }
