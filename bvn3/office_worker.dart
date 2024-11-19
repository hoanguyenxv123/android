import 'package:on_tap_buoi3/employee_management/employee.dart';
import 'package:on_tap_buoi3/employee_management/workable.dart';

class OfficeWorker extends Employee implements Workable {
  String? department;

  OfficeWorker(super.id, super.name, this.department);

  @override
  double caculateSalary() {
    return 5000;
  }

  @override
  void doWork() {
    print('$name làm bên : $department');
  }

  @override
  void printInfo() {
    super.printInfo();
    print('Phòng ban : $department');
  }
}
