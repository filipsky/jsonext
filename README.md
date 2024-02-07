# Usage

Explore the provided extension methods to streamline your JSON parsing. Here's a quick example:

```dart
import 'package:json_extensions/json_extensions.dart';

void main() {
  const Json data = {
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

  String name = data.asString('name', fallback: 'Unknown');
  print('Name: $name');

  int? age = data.asIntN('age');
  print('Age: $age');

  bool isStudent = data.asBool('isStudent', fallback: true);
  print('Is Student: $isStudent');

  DateTime birthDate = data.asDateTime('birthDate', fallback: DateTime.now());
  print('Birth Date: $birthDate');

  double? height = data.asDoubleN('height');
  print('Height: $height');

  List<int> grades = data.asList('grades', fallback: []);
  print('Grades: $grades');

  Json<Map<String, dynamic>> contact = data.asJson('contact', fallback: {});
  print('Contact: $contact');

  bool hasEmail = contact.has('email');
  print('Has Email: $hasEmail');

  String? email = contact.parseN('email', (json) => json.asStringN('email'), fallback: null);
  print('Email: $email');
}
```

## Features

- **Generic Type for JSON:** Introduces the `Json<T>` type, allowing strong typing for JSON objects.

- **Callback Signature for JSON Parsing:** Defines a callback signature, `FromJsonCallback<T>`, for creating custom parsers.

- **Extension Methods:** Offers a set of concise extension methods for common data types like integers, strings, booleans, date-time, doubles, maps, lists, and custom JSON structures.

- **Parsing with Custom Callback:** Versatile method, `parseN`, for parsing JSON values using a custom callback with optional fallback.

- **Check for Key Existence:** The `has` method allows checking for the existence of a specific key in the JSON object.
