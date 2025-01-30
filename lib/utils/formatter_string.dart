class Formatter {
  static String formatDate(String date) {
    return date.split('-').reversed.join('/');
  }

  static String formatIntToHour(int time) {
    final hours = time ~/ 60;
    final minutes = time % 60;
    return '$hours h $minutes min';
  }
}
