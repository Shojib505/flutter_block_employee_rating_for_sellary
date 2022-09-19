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

  //TODO: Step-5
  // StreamSink<List<Employee>> get employeeListSink =>
}
