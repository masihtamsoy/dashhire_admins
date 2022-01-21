import 'package:mobx/mobx.dart';

part 'dash_store.g.dart';

class DashStore = DashStoreBase with _$DashStore;

abstract class DashStoreBase with Store {
  @observable
  Map? jobSelected;

  @observable
  Map? applicationSelected;

  @observable
  Map? companyRoleSelected;

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  void selectJob(Map job) {
    print("-----jobSelected------- $job");
    jobSelected = job;
  }

  @action
  void selectApplication(Map application) {
    print("-----applicationSelected------- $application");
    applicationSelected = application;
  }

  @action
  void selectCompanyRole(Map companyRole) {
    print("-----companyRoleSelected------- $companyRole");
    companyRoleSelected = companyRole;
  }
}
