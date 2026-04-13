import 'dart:io';

void main(){

var isrunning = true;

const String title = "[=== Student Grader v1.0 ===]";

final Set<String> availableSubject = {

"Microprocessor",
"Data Structure",
"Object oriented",
"Internet Programming",
"Competitive Programming"

};

var students = [];

do{

print("""
$title

1. Add Student
2. Record Score
3. Add Bonus Points
4. Add Comment
5. View All Students
6. View Report Card
7. Class Summary
8. Exit

Choose option:
""");

var choice = stdin.readLineSync();

switch(choice){

// =====================
// CASE 1: ADD STUDENT
// =====================
case "1":

print("Enter student name:");

var name = stdin.readLineSync()!;

Map<String,dynamic> student = {

"name": name,
"Scores": [],
"Subjects": {...availableSubject}, // spread operator
"bonus": null,
"comment": null

};

students.add(student);

print("Student added successfully!");

break;
case "2":

if (students.isEmpty) {
print("Add student first");
break;
}

print("--- Student List ---");

for (int i = 0; i < students.length; i++) {
print("${i + 1}. ${students[i]["name"]}");
}

stdout.write("Select student number: ");
int index = int.parse(stdin.readLineSync()!) - 1;

var selectedStudent = students[index];

double score = -1;

// while loop → input validation
while (score < 0 || score > 100) {

stdout.write("Enter score (0-100): ");
score = double.parse(stdin.readLineSync()!);

if (score < 0 || score > 100) {
print("Invalid score! Try again");
}

}

selectedStudent["Scores"].add(score);

print("Score added successfully!");

break;
case "3":

stdout.write("Select student number: ");
int index = int.parse(stdin.readLineSync()!) - 1;

var selectedStudent = students[index];

stdout.write("Enter bonus (1-10): ");
int bonus = int.parse(stdin.readLineSync()!);

// null-aware assign (??=)
selectedStudent["bonus"] ??= bonus;

print("Bonus added!");

break;


case "4":

stdout.write("Select student number: ");
int index = int.parse(stdin.readLineSync()!) - 1;

var selectedStudent = students[index];

stdout.write("Enter comment: ");
String comment = stdin.readLineSync()!;

// normal assignment
selectedStudent["comment"] = comment;

print("Comment added!");

break;

// =====================
// CASE 8: EXIT
// =====================
case "8":

isrunning = false;

break;

default:

print("Invalid choice");

}

}while(isrunning);

}