import 'package:jsonext/jsonext.dart';

void main() {
  const data = {
    'name': 'John Doe',
    'age': 30,
    'isStudent': false,
    'isStudent2': 'YES',
    'birthDate': '1992-05-15',
    'height': 5.9,
    'grades': [90, 85, 78],
    'contact': {
      'email': 'john@example.com',
      'phone': '123-456-7890',
    },
  };

  final name = data.asString('name', fallback: 'Unknown');
  print('Name: $name');

  final age = data.asIntN('age');
  print('Age: $age');

  final isStudent = data.asBool('isStudent', fallback: true);
  print('Is Student: $isStudent');

  final isStudent2 = data.asBool('isStudent2', fallback: true);
  print('Is Student2: $isStudent2');

  final birthDate = data.asDateTime('birthDate', fallback: DateTime.now());
  print('Birth Date: $birthDate');

  final height = data.asDoubleN('height');
  print('Height: $height');

  final grades = data.asList('grades', fallback: []);
  print('Grades: $grades');

  final contact = data.asJson('contact', fallback: {});
  print('Contact: $contact');

  final hasEmail = contact.has('email');
  print('Has Email: $hasEmail');

  // Contact object is not defined in this example.
  final contactObj = json.parseN(
    'contact',
    Contact.fromJson,
    fallback: null,
  );
  print(contactObj);

  const jsonString = "{ 'name': 'John Doe', 'age': 30, 'isStudent': false, }";
  final decodedJson = jsonString.decode;
  print(decodedJson);
}
