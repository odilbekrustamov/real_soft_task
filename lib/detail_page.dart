import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  static final String id = "detail_page";

  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
              child: Text(
            'Counter:',
            style: TextStyle(fontSize: 24.0, color: Colors.red),
          ))
        ],
      ),
    );
  }
}
