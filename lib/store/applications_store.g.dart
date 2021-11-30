// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applications_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ApplicationStore on _ApplicationStore, Store {
  Computed<int>? _$totalItemsComputed;

  @override
  int get totalItems =>
      (_$totalItemsComputed ??= Computed<int>(() => super.totalItems,
              name: '_ApplicationStore.totalItems'))
          .value;

  final _$valueAtom = Atom(name: '_ApplicationStore.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$selectedItemAtom = Atom(name: '_ApplicationStore.selectedItem');

  @override
  Map<dynamic, dynamic>? get selectedItem {
    _$selectedItemAtom.reportRead();
    return super.selectedItem;
  }

  @override
  set selectedItem(Map<dynamic, dynamic>? value) {
    _$selectedItemAtom.reportWrite(value, super.selectedItem, () {
      super.selectedItem = value;
    });
  }

  final _$_ApplicationStoreActionController =
      ActionController(name: '_ApplicationStore');

  @override
  void increment() {
    final _$actionInfo = _$_ApplicationStoreActionController.startAction(
        name: '_ApplicationStore.increment');
    try {
      return super.increment();
    } finally {
      _$_ApplicationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectItem(Map<dynamic, dynamic> item) {
    final _$actionInfo = _$_ApplicationStoreActionController.startAction(
        name: '_ApplicationStore.selectItem');
    try {
      return super.selectItem(item);
    } finally {
      _$_ApplicationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
selectedItem: ${selectedItem},
totalItems: ${totalItems}
    ''';
  }
}
