import 'package:intl/intl.dart';

extension StringExtension on String {
  bool get isValidEmail => Regexes.emailRegex.hasMatch(this);

  //* An extension for validating String is a name.
  bool get isValidName => Regexes.nameRegex.hasMatch(this);

  //* An extension for validating String is a contact.
  bool get isValidContact => Regexes.contactRegex.hasMatch(this);

  //* An extension for validating String is a Zipcode.
  bool get isValidZipCode => Regexes.zipCodeRegex.hasMatch(this);

  //* An extension for converting String to Capital case.
  String get capitalize => this[0].toUpperCase() + substring(1).toLowerCase();

  String capitalizeSentence(String data) {
    var li = split(' ');
    var data = li.map((element) => element[0].toUpperCase() + element.substring(1).toLowerCase());
    return data.join(' ');
  }

  String get capitalizeSen => capitalizeSentence(this);

  //* An extension for replacing underscores in a String with spaces.
  String get removeUnderScore => replaceAll('_', ' ');

  String get breakString {
    final pattern = RegExp('([a-z])([A-Z])');
    return replaceAllMapped(pattern, (match) => '${match[1]} ${match[2]}');
  }
}

class Regexes {
  const Regexes._();

  //* The regular expression for validating emails in the app.
  static RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\.]+\.(com|pk)+",
  );

  //* The regular expression for validating contacts in the app.
  static RegExp contactRegex = RegExp(r'^(?:[+0]9)?[0-9]{10}$');

  //* The regular expression for validating names in the app.
  static RegExp nameRegex = RegExp(r'^[a-z A-Z]+$');

  //* The regular expression for validating zip codes in the app.
  static RegExp zipCodeRegex = RegExp(r'^\d{5}$');
}

extension ShowString on String? {
  String get show => this != null && this!.isNotEmpty? this! : '';
  String get showNotAval => this != null && this!.isNotEmpty ? this! : 'Not Available';
  DateTime? get toDateTime => this != null ? DateFormat('hh:mm').tryParse(this!) : null;
}
