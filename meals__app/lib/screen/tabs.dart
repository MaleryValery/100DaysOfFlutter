import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabs Screen'),
      ),
      body: const Center(
        child: Text('Tabs Screen'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (indexTab) {
          print(indexTab);
        },
        items: [],
      ),
    );
  }
}
