// code created by https://www.youtube.com/@flutterflowexpert

List<String> filterDuplicates(List<String>? input) {
  input = input ?? [];

  return input.toSet().toList();
}