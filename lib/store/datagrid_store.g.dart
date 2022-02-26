// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datagrid_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DataGridStore on DataGridStoreBase, Store {
  final _$dataAtom = Atom(name: 'DataGridStoreBase.data');

  @override
  List<dynamic>? get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(List<dynamic>? value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$generateDataAsyncAction =
      AsyncAction('DataGridStoreBase.generateData');

  @override
  Future<void> generateData(String tableName) {
    return _$generateDataAsyncAction.run(() => super.generateData(tableName));
  }

  final _$DataGridStoreBaseActionController =
      ActionController(name: 'DataGridStoreBase');

  @override
  void setData(List<dynamic> items) {
    final _$actionInfo = _$DataGridStoreBaseActionController.startAction(
        name: 'DataGridStoreBase.setData');
    try {
      return super.setData(items);
    } finally {
      _$DataGridStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data}
    ''';
  }
}
