import 'package:flutter/material.dart';

class WidgetRow extends StatelessWidget {
  const WidgetRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Row'),
      ),
      body: Row(
        children: [
          Text("Row 1"),
          Text("Row 4"),
          Text("Row 5"),
          Text("Row 6"),
        ],
      ),
    );
  }
}
