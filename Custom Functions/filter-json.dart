// code created by https://www.youtube.com/@flutterflowexpert
// video - https://youtu.be/x-kivZ7ChD8
// if you have problem implementing this code you can hire me as a mentor - https://calendly.com/bulgaria_mitko

List<dynamic> filterJson(
  List<dynamic> data,
  String? field,
  String? operation,
  String? value,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  List<dynamic> filteredList = [];

  for (dynamic item in data) {
    List<String> fields = field!.split('.');
    dynamic itemValue = item;

    for (String f in fields) {
      itemValue = itemValue[f];
    }

    bool isMatch = false;

    switch (operation) {
      case '==':
        if (itemValue is String && value is String) {
          isMatch = itemValue.toLowerCase() == value.toLowerCase();
        } else {
          isMatch = itemValue == value;
        }
        break;
      case 'contains':
        if (itemValue is String && value is String) {
          isMatch = itemValue.toLowerCase().contains(value.toLowerCase());
        } else {
          throw ArgumentError(
              'Unsupported field type for "contains" operation');
        }
        break;
      default:
        throw ArgumentError('Unsupported operation');
    }

    if (isMatch) {
      filteredList.add(item);
    }
  }

  return filteredList;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}