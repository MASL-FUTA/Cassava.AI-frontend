class Util{
  static var months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  static var monthsShort = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  static String getMonthShort(int month) {
    return monthsShort[month - 1];
  }

  static var dayShort = ["Mon", "Tue", "Wed", "Thurs", "Fri", "Sat", "Sun"];

  static String date2(String input, {String sep = "-"}) {
    var date =
    DateTime.fromMillisecondsSinceEpoch(int.parse(input), isUtc: true);
    var day = date.weekday - 1;
    var monthInt = date.month;
    var year = date.year.toString();
    return "${date.day}$sep${Util.monthsShort[monthInt]}$sep$year";
  }
}