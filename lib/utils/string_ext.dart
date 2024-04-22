extension StringX on String {
  /// Returns the string itself. Using this method is a way to make it easier to
  /// identify that a string is being used as a hard-coded value.
  String get hardCode => this;
  String wordsInitials([int maxWords = 2]) {
    return split(' ').take(maxWords).map((e) => e[0]).join().toUpperCase();
  }
}
