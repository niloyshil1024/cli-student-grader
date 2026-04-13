import 'dart:io';

void main() {

// mutable variable → program control
var isrunning = true;

// const → app title never changes
const String title = "[=== Student Grader v1.0 ===]";

// final Set → fixed subjects list (no modification needed)
final Set<String> availableSubject = {

"Microprocessor",
"Data Structure",
"Object oriented",
"Internet Programming",
"Competitive Programming"

};

// List → store all students (dynamic structure)
var students = [];

do {

// multi-line string → CLI menu UI
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

// null-aware input safety
var choice = stdin.readLineSync() ?? "";

// switch → menu routing
switch (choice) {

// =====================
// CASE 1: ADD STUDENT
// =====================
case "1":

print("Enter student name:");
var name = stdin.readLineSync() ?? "";

// Map → single student record
Map<String, dynamic> student = {

"name": name,
"Scores": [], // List → multiple scores store
"Subjects": {...availableSubject}, // spread operator → copy Set
"bonus": null, // nullable int? (not fixed yet)
"comment": null // nullable String? (not fixed yet)

};

students.add(student);
print("Student added successfully!");

break;

// =====================
// CASE 2: RECORD SCORE
// =====================
case "2":

if (students.isEmpty) {
print("Add student first");
break;
}

// indexed for loop → show list with index
for (int i = 0; i < students.length; i++) {
print("${i + 1}. ${students[i]["name"]}");
}

stdout.write("Select student number: ");
int index = int.parse(stdin.readLineSync() ?? "0") - 1;

// validation → prevent crash
if (index < 0 || index >= students.length) {
print("Invalid student selection");
break;
}

var selectedStudent = students[index];

// while loop → input validation (0-100)
double score = -1;

while (score < 0 || score > 100) {

stdout.write("Enter score (0-100): ");
score = double.parse(stdin.readLineSync() ?? "-1");

if (score < 0 || score > 100) {
print("Invalid score! Try again");
}

}

// List → add score
selectedStudent["Scores"].add(score);

print("Score added successfully!");

break;

// =====================
// CASE 3: ADD BONUS
// =====================
case "3":

for (int i = 0; i < students.length; i++) {
print("${i + 1}. ${students[i]["name"]}");
}

stdout.write("Select student number: ");
int index = int.parse(stdin.readLineSync() ?? "0") - 1;

if (index < 0 || index >= students.length) {
print("Invalid student selection");
break;
}

var selectedStudent = students[index];

stdout.write("Enter bonus (1-10): ");
int bonus = int.parse(stdin.readLineSync() ?? "0");

// ??= → assign only if null
selectedStudent["bonus"] ??= bonus;

print("Bonus added successfully!");

break;

// =====================
// CASE 4: ADD COMMENT
// =====================
case "4":

for (int i = 0; i < students.length; i++) {
print("${i + 1}. ${students[i]["name"]}");
}

stdout.write("Select student number: ");
int index = int.parse(stdin.readLineSync() ?? "0") - 1;

if (index < 0 || index >= students.length) {
print("Invalid student selection");
break;
}

var selectedStudent = students[index];

stdout.write("Enter comment: ");
String comment = stdin.readLineSync() ?? "";

// String? → store feedback
selectedStudent["comment"] = comment;

print("Comment added successfully!");

break;

// =====================
// CASE 5: VIEW ALL STUDENTS
// =====================
case "5":

if (students.isEmpty) {
print("No students found");
break;
}

print("---- ALL STUDENTS ----");

// for-in loop → iterate list
for (var student in students) {

// collection if → conditional UI tags
var tags = [
student["name"],
"${student["Scores"].length} scores",
if (student["bonus"] != null) "Bonus Added",
if (student["comment"] != null) "Comment Added"
];

print(tags.join(" | "));
}

break;

// =====================
// CASE 6: REPORT CARD
// =====================
case "6":

if (students.isEmpty) {
print("No students found");
break;
}

// indexed list
for (int i = 0; i < students.length; i++) {
print("${i + 1}. ${students[i]["name"]}");
}

stdout.write("Select student number: ");
int index = int.parse(stdin.readLineSync() ?? "0") - 1;

if (index < 0 || index >= students.length) {
print("Invalid student selection");
break;
}

var student = students[index];

// arithmetic operator → sum calculation
double sum = 0;

for (var s in student["Scores"]) {
sum += s;
}

// average calculation
double avg = student["Scores"].isEmpty
    ? 0
    : sum / student["Scores"].length;

// null-aware → bonus fallback
avg += (student["bonus"] ?? 0);

// if-else → grade logic
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

// multi-line UI output
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

// =====================
// CASE 7: CLASS SUMMARY
// =====================
case "7":

if (students.isEmpty) {
print("No students found");
break;
}

int totalStudents = students.length;
int passCount = 0;
int failCount = 0;

// Set → unique grades
Set<String> gradeSet = {};

// collection for → summary list
var summaryLines = [
for (var s in students)
"${s["name"]} → ${s["Scores"].isEmpty ? "No Scores" : "Has Scores"}"
];

// loop → calculations
for (var student in students) {

double sum = 0;

for (var s in student["Scores"]) {
sum += s;
}

// average
double avg = student["Scores"].isEmpty
    ? 0
    : sum / student["Scores"].length;

// bonus (??)
avg += (student["bonus"] ?? 0);

// grade
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

// add to Set → unique values
gradeSet.add(grade);

// logical operator (&&)
if (student["Scores"].isNotEmpty && avg >= 60) {
passCount++;
} else {
failCount++;
}

}

// final output
print("""
[]===== CLASS SUMMARY =====[]
|| Total Students: $totalStudents
|| Passed: $passCount
|| Failed: $failCount
|| Unique Grades: $gradeSet

----------------------------
|| Individual Summary:
${summaryLines.join("\n")}
============================
""");

break;

// =====================
// EXIT
// =====================
case "8":
isrunning = false;
break;

default:
print("Invalid choice");
}

} while (isrunning);

}