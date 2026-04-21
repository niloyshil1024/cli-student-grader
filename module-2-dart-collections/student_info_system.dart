void main(){
//step 2: List practice(Ordered Data)
//Growable list
  List <String> Students=["Niloy","Reyan","Tanmoy"];

  //add new 
  Students.add("Antu");
  print("Students list : $Students");
  //fixed length list
  List<int> id = List.filled(3, 0);
  print("Fixed id : $id");
  //remove element
  Students.remove("Niloy");
  //insert element
  Students.insert(1, "Shuvo");
  print("Update student list : $Students");
  //sorting list
  List<int> num = [1,23,24,28,11];
  num.sort();
  print("Sorted number : $num");

  //step 3: set practice(unique element)
  // duplicate not allowed ! it's automatically removed
  Set<String> subject = {"Algorthm","Data Structure","Microprocessor","Algorithm"};
  print("Unique subjects : $subject");

  //add element
  subject.add("Numerical method");
  //remove element
  subject.remove("Microprocessor");
  print("Updated subjects : $subject");

  //two sets
  Set<int> num1={1,2,3,4};
  Set<int> num2={3,4,5,6};
//union
print("Union : ${num1.union(num2)}");
//intersection
print("Intersection : ${num1.intersection(num2)}");
//Difference
print("Difference : ${num1.difference(num2)}");

// Step 4: Map Practice (Key-Value)
  // Student age map
Map<String, int> studentAge = {
  "Niloy": 22,
  "Tanmoy": 23
};  
print("Niloy Age: ${studentAge["Niloy"]}");

// Step 5: Nested Map
// Nested Map (Student Details)
Map<int, Map<String, dynamic>> studentInfo = {
  101: {
  "name": "Niloy",
  "grade": "A"
},
  102: {
  "name": "Tanmoy",
  "grade": "B"
}

};
print("Nested Map Data: $studentInfo");

//Step 6: Map Methods
Map<String, int> marks = {
  "Math": 90,
  "English": 85
};
// Getting keys
print("Subjects: ${marks.keys}");
// Getting values
print("Marks: ${marks.values}");

// Step 7 & 8: Student Info System
  

// List of Maps (Student System)
List<Map<String, dynamic>> studentList = [

{
  "name": "Niloy",
  "roll": 101,
  "grade": "A"
},

{
  "name": "Antu",
  "roll": 102,
  "grade": "B"
}

];

  // Add new student
studentList.add({
  "name": "Reyan",
  "roll": 103,
  "grade": "A+"
});

// Display all students
print("\nStudent Information:");
for (var student in studentList) {
print(student);
}
}