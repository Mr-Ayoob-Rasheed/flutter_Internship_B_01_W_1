import 'dart:io';
void main()
{
  print("Dart collections file, Task 1.2");

  List<int> integerList = [10,20,30,40,50];
  integerList.add(6);
  integerList.remove(30);
  integerList.insert(3,3);
  print("List after operations: $integerList");

  Set<String> stringset={"House","Home","Humble abode"};
  print("Set elements (unique): $stringset");

  Map<int,String> student_ids={
    1101:"Dihya",
    1102:"Salman",
    1103:"yaseen"
  };
  print("Student IDs Map: $student_ids");

  List<int> squaredNumbers =
    integerList.map((n) => n * n).toList();
  print("Squared numbers: $squaredNumbers");

  List<int> filteredNumbers =
      squaredNumbers.where((n) => n > 20).toList();
  print("Numbers > 20: $filteredNumbers");

  int sum = integerList.reduce((a, b) => a + b);
  print("Sum of numbers: $sum");

  List<Map<String, dynamic>> students = [];
  students.add({"id": 1101, "name": "Dihya","marks": 92}); 
  students.add({"id": 1102, "name": "Salman","marks": 83});
  students.add({"id": 1103, "name": "Yaseen","marks": 40});
  students.add({"id": 1102, "name": "Owais","marks": 52});
  students.add({"id": 1103, "name": "Muaz","marks": 53});

  students.sort((a, b) => b["marks"].compareTo(a["marks"]));
  print("Students sorted by marks: $students");
  students.forEach((s) {
    print("${s['name']} : ${s['marks']}\n");
  });

  List<Map<String,dynamic>> topStudents=
    students.where((s) =>s["marks"]>75).toList();
  print("Top scoring students: \n");
  topStudents.forEach((s) {
    print("${s['name']} : ${s['marks']}\n");
  });

  print("\nEnter student name to search:");
  String searchName = stdin.readLineSync()!;
  var foundStudent = students.firstWhere(
    (s) => s["name"].toString().toLowerCase() == searchName.toLowerCase(),
    orElse: () => {"id": null, "name": "Not Found", "marks": null}
  
  );
  print("Search result: $foundStudent");

}