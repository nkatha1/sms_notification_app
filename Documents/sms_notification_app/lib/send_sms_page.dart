import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/sms_model.dart';

class SendSmsPage extends StatefulWidget {
  final bool liveMode;
  const SendSmsPage({super.key, required this.liveMode});

  @override
  State<SendSmsPage> createState() => _SendSmsPageState();
}

class _SendSmsPageState extends State<SendSmsPage> {
  final phone = TextEditingController();
  final message = TextEditingController();
  bool sending = false;

  Future<void> sendSms() async {
    setState(() => sending = true);

    if (widget.liveMode) {
      await http.post(
        Uri.parse("https://your-backend-url.onrender.com/send-sms"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "phone": phone.text,
          "message": message.text,
        }),
      );
    }

    SmsHistory.add(
      SmsModel(phone: phone.text, message: message.text),
    );

    phone.clear();
    message.clear();
    setState(() => sending = false);

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("SMS processed")));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: phone,
                decoration:
                    const InputDecoration(labelText: "Phone Number"),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: message,
                maxLines: 4,
                decoration: const InputDecoration(labelText: "Message"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: sending ? null : sendSms,
                child: sending
                    ? const CircularProgressIndicator()
                    : const Text("Send SMS"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
