class SmsModel {
  final String phone;
  final String message;
  final DateTime time;

  SmsModel({
    required this.phone,
    required this.message,
  }) : time = DateTime.now();
}

class SmsHistory {
  static final List<SmsModel> _items = [];

  static List<SmsModel> get items => _items;

  static void add(SmsModel sms) => _items.insert(0, sms);
}