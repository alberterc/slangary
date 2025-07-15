class Time {
  final DateTime dateTime;

  Time({required this.dateTime});

  final months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  String formatToDateWithMonthName() {
    return '${months[dateTime.month - 1]} ${dateTime.day}, ${dateTime.year}';
  }
}
