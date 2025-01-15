```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final List<dynamic>? jsonData = jsonDecode(response.body);
      // Check for null and empty lists
      if (jsonData != null && jsonData.isNotEmpty) {
        final firstElement = jsonData[0];
        print('First element: $firstElement');
      } else {
        print('No data received from the API.');
      }
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    // Add more robust error handling here, such as logging the error to a service or displaying to the user
  }
}
```