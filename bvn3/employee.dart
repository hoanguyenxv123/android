abstract class Employee {
  String? id;
  String? name;

  Employee(this.id, this.name);

  void printInfo() {
    print('Mã nhân viên : $id\nTên nhân viên : $name');
  }

  double caculateSalary();
}
