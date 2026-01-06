import 'package:flutter/material.dart';
import 'models/sms_model.dart';

class SmsHistoryPage extends StatelessWidget {
  const SmsHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: SmsHistory.items.length,
      itemBuilder: (context, index) {
        final sms = SmsHistory.items[index];
        return ListTile(
          leading: const Icon(Icons.sms),
          title: Text(sms.phone),
          subtitle: Text(sms.message),
          trailing: Text(
            "${sms.time.hour}:${sms.time.minute.toString().padLeft(2, '0')}",
          ),
        );
      },
    );
  }
}