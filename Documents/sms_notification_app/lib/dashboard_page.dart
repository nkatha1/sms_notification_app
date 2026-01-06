import 'package:flutter/material.dart';
import 'send_sms_page.dart';
import 'sms_history_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;
  bool liveMode = false;

  @override
  Widget build(BuildContext context) {
    final pages = [
      SendSmsPage(liveMode: liveMode),
      const SmsHistoryPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("SMS Admin Dashboard"),
        actions: [
          Row(
            children: [
              const Text("Live"),
              Switch(
                value: liveMode,
                onChanged: (v) => setState(() => liveMode = v),
              ),
            ],
          ),
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => currentIndex = i),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.send), label: "Send SMS"),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: "History"),
        ],
      ),
    );
  }
}