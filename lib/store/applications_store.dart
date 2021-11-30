import 'package:mobx/mobx.dart';

// Include generated file
part 'applications_store.g.dart';

// This is the class used by rest of your codebase
class ApplicationStore = _ApplicationStore with _$ApplicationStore;

// The store-class
abstract class _ApplicationStore with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
