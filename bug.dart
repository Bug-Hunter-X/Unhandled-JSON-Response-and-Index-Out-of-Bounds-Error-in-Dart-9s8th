```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Assuming the API returns a JSON list
      final List<dynamic> jsonData = jsonDecode(response.body);
      // Accessing elements may throw an exception if jsonData is not a list or is empty
      final firstElement = jsonData[0]; // potential error if the list is empty
      print('First element: $firstElement');
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    // Add more robust error handling here like logging or displaying to user
  }
}
```