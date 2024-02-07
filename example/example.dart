import 'package:json_kit/json_kit.dart';

void main() {
  const data = {
    'name': 'John Doe',
    'age': 30,
    'isStudent': false,
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

  final email = contact.parseN(
    'email',
    (json) => json.asStringN('email'),
    fallback: null,
  );
  print('Email: $email');
}
