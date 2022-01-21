// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dash_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashStore on DashStoreBase, Store {
  final _$jobSelectedAtom = Atom(name: 'DashStoreBase.jobSelected');

  @override
  Map<dynamic, dynamic>? get jobSelected {
    _$jobSelectedAtom.reportRead();
    return super.jobSelected;
  }

  @override
  set jobSelected(Map<dynamic, dynamic>? value) {
    _$jobSelectedAtom.reportWrite(value, super.jobSelected, () {
      super.jobSelected = value;
    });
  }

  final _$applicationSelectedAtom =
      Atom(name: 'DashStoreBase.applicationSelected');

  @override
  Map<dynamic, dynamic>? get applicationSelected {
    _$applicationSelectedAtom.reportRead();
    return super.applicationSelected;
  }

  @override
  set applicationSelected(Map<dynamic, dynamic>? value) {
    _$applicationSelectedAtom.reportWrite(value, super.applicationSelected, () {
      super.applicationSelected = value;
    });
  }

  final _$companyRoleSelectedAtom =
      Atom(name: 'DashStoreBase.companyRoleSelected');

  @override
  Map<dynamic, dynamic>? get companyRoleSelected {
    _$companyRoleSelectedAtom.reportRead();
    return super.companyRoleSelected;
  }

  @override
  set companyRoleSelected(Map<dynamic, dynamic>? value) {
    _$companyRoleSelectedAtom.reportWrite(value, super.companyRoleSelected, () {
      super.companyRoleSelected = value;
    });
  }

  final _$valueAtom = Atom(name: 'DashStoreBase.value');

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

  final _$DashStoreBaseActionController =
      ActionController(name: 'DashStoreBase');

  @override
  void increment() {
    final _$actionInfo = _$DashStoreBaseActionController.startAction(
        name: 'DashStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$DashStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectJob(Map<dynamic, dynamic> job) {
    final _$actionInfo = _$DashStoreBaseActionController.startAction(
        name: 'DashStoreBase.selectJob');
    try {
      return super.selectJob(job);
    } finally {
      _$DashStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectApplication(Map<dynamic, dynamic> application) {
    final _$actionInfo = _$DashStoreBaseActionController.startAction(
        name: 'DashStoreBase.selectApplication');
    try {
      return super.selectApplication(application);
    } finally {
      _$DashStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectCompanyRole(Map<dynamic, dynamic> companyRole) {
    final _$actionInfo = _$DashStoreBaseActionController.startAction(
        name: 'DashStoreBase.selectCompanyRole');
    try {
      return super.selectCompanyRole(companyRole);
    } finally {
      _$DashStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
jobSelected: ${jobSelected},
applicationSelected: ${applicationSelected},
companyRoleSelected: ${companyRoleSelected},
value: ${value}
    ''';
  }
}
