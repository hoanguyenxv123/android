import 'package:on_tap_buoi3/employee_management/employee.dart';
import 'package:on_tap_buoi3/employee_management/officeWorker.dart';
import 'package:on_tap_buoi3/employee_management/techWorker.dart';

class Company {
  late List<Employee> employees;

  Company() {
    employees = [];
  }

  void addEmployee() {
    employees.add(OfficeWorker('NV1', 'Hòa', 'Phòng nhân sự'));
    employees.add(OfficeWorker('NV2', 'Linh', 'Phòng kế toán'));
    employees.add(TechWorker('NV3', 'Nam', 'Coding'));
    employees.add(TechWorker('NV4', 'Cương', 'Phân tích dữ liệu'));
  }

  void printAllEmployees() {
    for (var employee in employees) {
      employee.printInfo();
      print('-----------');
    }
  }

  double getToTalSalary() {
    double total = 0;
    for (var employee in employees) {
      total += employee.caculateSalary();
    }
    return total;
  }
}

void main() {
  Company company = new Company();
  company.addEmployee();
  print('Danh sách tất cả nhân viên : ');
  company.printAllEmployees();
  print('Tổng tiền lương cua công ty : ${company.getToTalSalary()}');
}
