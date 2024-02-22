import 'package:intl/intl.dart';

reformatApiDate(String value) {
  return "${value.toString().split('-')[2]}-${value.toString().split('-')[1]} - ${value.toString().split('-')[0]}";
}

formatMonthYear(value) {
  final df = DateFormat('dd MMM yyyy');
  var d = df.format(value).split(' ');
  var f = d[1].substring(0, 3);
  return '${d[0]} $f,  ${d[2]}';
}
