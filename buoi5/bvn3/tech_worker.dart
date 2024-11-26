import 'package:on_tap_buoi3/employee_management/employee.dart';
import 'package:on_tap_buoi3/employee_management/workable.dart';

class TechWorker extends Employee implements Workable {
  String? field;

  TechWorker(super.id, super.name, this.field);

  @override
  double caculateSalary() {
    return 8000;
  }

  @override
  void doWork() {
    print('$name làm bên : $field');
  }

  @override
  void printInfo() {
    super.printInfo();
    print('Lĩnh vực kĩ thuật : $field');
  }
}
