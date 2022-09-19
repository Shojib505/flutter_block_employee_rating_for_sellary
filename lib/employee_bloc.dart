import 'dart:async';
import 'employee.dart';

/*
 ! Step-1 imports
 ! Step-2 List of employees
 ! Step-3 Stream controllers
 ! Step-4 Stream Sink getter
 ! Step-5 Constructor - add data; listen to changes
 ! Step-6 Core fuctions
 ! Step-7 dispose
*/

class EmployeeBloc {
  //sink to add in pipe
  //stream to get data from
  //by pipe i mean data flow

  //TODO: Step-2
  List<Employee> employeeList = [
    Employee(1, 'Employee One', 10000.0),
    Employee(2, 'Employee Two', 20000.0),
    Employee(3, 'Employee Three', 30000.0),
    Employee(4, 'Employee Four', 40000.0),
    Employee(5, 'Employee Five', 50000.0),
  ];

  //TODO: Step-3
  final employeeListStreamController = StreamController<List<Employee>>();
  //for increment & decrement
  final employeeSalaryIncrementStremController = StreamController<Employee>();
  final employeeSalaryDecrementStremController = StreamController<Employee>();

  //TODO: Step-4
  //getters
  Stream<List<Employee>> get employeeListStream =>
      employeeListStreamController.stream;

  StreamSink<List<Employee>> get employeeListSink =>
      employeeListStreamController.sink;

  StreamSink<Employee> get employeeSalaryIncrement =>
      employeeSalaryIncrementStremController.sink;
  StreamSink<Employee> get employeeSalaryDecrement =>
      employeeSalaryDecrementStremController.sink;

  //TODO: Step-5
  EmployeeBloc() {
    employeeListStreamController.add(employeeList);

    employeeSalaryIncrementStremController.stream.listen(_incrementSalary);
    employeeSalaryDecrementStremController.stream.listen(_decrementSalary);
  }

  //TODO: Step-6 Core fuctions

  _incrementSalary(Employee employee) {
    double salary = employee.salary;
    double incrementedSalary = salary * 20 / 100;

    employeeList[employee.id - 1].salary = salary + incrementedSalary;
    employeeListSink.add(employeeList);
  }

  _decrementSalary(Employee employee) {
    double salary = employee.salary;
    double decrementSalary = salary * 20 / 100;

    employeeList[employee.id - 1].salary = salary - decrementSalary;
    employeeListSink.add(employeeList);
  }

  //TODO: Step-7 dispose
  void dispose() {
    employeeListStreamController.close();
    employeeSalaryIncrementStremController.close();
    employeeSalaryDecrementStremController.close();
  }
}
