class DateService {
  static String formatDateToday() {
    DateTime now = DateTime.now();
    List<String> daysOfWeek = [
      'Luni',
      'Marti',
      'Miercuri',
      'Joi',
      'Vineri',
      'Sambata',
      'Duminica'
    ];

    List<String> months = [
      'Ianuarie',
      'Februarie',
      'Martie',
      'Aprilie',
      'Mai',
      'Iunie',
      'Iulie',
      'August',
      'Septembrie',
      'Octombrie',
      'Noiembrie',
      'Decembrie'
    ];

    String dayName = daysOfWeek[now.weekday - 1];

    int dayOfMonth = now.day;

    String monthName = months[now.month - 1];

    String formattedDate = '$dayName, $dayOfMonth $monthName';

    return formattedDate;
  }
}
