extension StringX on String {
  String wordsInitials([int maxWords = 2]) {
    return split(' ').take(maxWords).map((e) => e[0]).join().toUpperCase();
  }
}
