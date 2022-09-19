import 'package:flutter/material.dart';
import 'package:flutter_block_empoyee_rating_for_sellery/employee.dart';
import 'package:flutter_block_empoyee_rating_for_sellery/employee_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*
  STREMBUILDER FOR DYNAMIC UI & with setstate(){}
  https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html 
   */
  final EmployeeBloc _employeeBloc = EmployeeBloc();

  @override
  void dispose() {
    _employeeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee App"),
      ),
      body: Container(
        child: StreamBuilder<List<Employee>>(
          stream: _employeeBloc.employeeListStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          snapshot.data![index].id.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            snapshot.data![index].name,
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            snapshot.data![index].salary.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: IconButton(
                          icon: Icon(Icons.thumb_up, color: Colors.green[400]),
                          onPressed: () {
                            _employeeBloc.employeeSalaryIncrementStremController
                                .add(snapshot.data![index]);
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: IconButton(
                          icon: Icon(Icons.thumb_down, color: Colors.red[400]),
                          onPressed: () {
                            _employeeBloc.employeeSalaryDecrementStremController
                                .add(snapshot.data![index]);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
