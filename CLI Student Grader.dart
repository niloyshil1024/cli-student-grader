import 'dart:io';

void main(){

var isrunning = true; // var → mutable variable

do{ // do-while loop

print("""
[=== Student Grader v1.0 ===]

1. Add Student
2. Record Score
3. Add Bonus Points
4. Add Comment
5. View All Students
6. View Report Card
7. Class Summary
8. Exit

Choose option:
"""); // multi-line string

var choice = stdin.readLineSync(); // var

switch(choice){ // switch

case "1":
print("Add Student");
break;

case "8":
isrunning = false;
break;

default:
print("Invalid");

}

}while(isrunning); // do-while

}