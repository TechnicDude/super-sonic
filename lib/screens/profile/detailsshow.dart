import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class DetailsShowScreenActivity extends StatefulWidget {
  final String title;
  final String description;
  const DetailsShowScreenActivity({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  State<DetailsShowScreenActivity> createState() =>
      _DetailsShowScreenActivityState();
}

class _DetailsShowScreenActivityState extends State<DetailsShowScreenActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: HtmlWidget(widget.description),
        ),
      ),
    );
  }
}
