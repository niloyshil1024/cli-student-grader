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
case "5":

if (students.isEmpty) {
print("No students found");
break;
}

print("---- ALL STUDENTS ----");

// for-in loop
for (var student in students) {

var tags = [
student["name"],
"${student["Scores"].length} scores",

// collection if
if (student["bonus"] != null) "Bonus Added",
if (student["comment"] != null) "Comment Added"
];

print(tags.join(" | "));
}

break;
case "6":

if (students.isEmpty) {
print("No students found");
break;
}

print("--- Select Student ---");

for (int i = 0; i < students.length; i++) {
print("${i + 1}. ${students[i]["name"]}");
}

int index = int.parse(stdin.readLineSync()!) - 1;

var student = students[index];

// average calculation
double sum = 0;

for (var s in student["Scores"]) {
sum += s;
}

double avg = student["Scores"].isEmpty ? 0 : sum / student["Scores"].length;

// bonus add (?? operator)
avg += (student["bonus"] ?? 0);

// grade calculation
String grade;

if (avg >= 90) {
grade = "A";
} else if (avg >= 80) {
grade = "B";
} else if (avg >= 70) {
grade = "C";
} else if (avg >= 60) {
grade = "D";
} else {
grade = "F";
}

print("""
[]===== REPORT CARD =====[]
|| Name: ${student["name"]}
|| Scores: ${student["Scores"]}
|| Bonus: ${student["bonus"] ?? 0}
|| Average: $avg
|| Grade: $grade
|| Comment: ${student["comment"] ?? "No comment"}
=======================
""");

break;
case "7":

if (students.isEmpty) {
print("No students found");
break;
}

int totalStudents = students.length;

int passCount = 0;

Set<String> grades = {};

var summaryLines = [

for (var s in students)
"${s["name"]} → ${s["Scores"].isNotEmpty ? "Has Scores" : "No Scores"}"

];

for (var student in students) {

double sum = 0;

for (var s in student["Scores"]) {
sum += s;
}

double avg = student["Scores"].isEmpty ? 0 : sum / student["Scores"].length;

avg += (student["bonus"] ?? 0);

// logical operator (&&)
if (student["Scores"].isNotEmpty && avg >= 60) {
passCount++;
}

// grade
String grade;

if (avg >= 90) grade = "A";
else if (avg >= 80) grade = "B";
else if (avg >= 70) grade = "C";
else if (avg >= 60) grade = "D";
else grade = "F";

grades.add(grade);

}

print("""
Total Students: $totalStudents
Pass Students: $passCount
Unique Grades: $grades

--- Summary ---
${summaryLines.join("\n")}
""");

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