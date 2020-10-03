import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async{
  task1();
  String task2data= await task2();
  task3(task2data);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async{
  Duration sleepTime = Duration(seconds:5);
  String result;
  await Future.delayed(sleepTime, (){
    result = 'task 2 data';
    print('Task 2 complete');
  });

  return result;
}

void task3(String s) {
  String result = 'task 3 data';
  print('Task 3 completed & output equals $s');
}