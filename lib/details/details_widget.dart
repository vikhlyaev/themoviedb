import 'package:flutter/material.dart';
import 'widgets/details_main_info_widget.dart';

class DetailsWidget extends StatefulWidget {
  final int id;
  const DetailsWidget({super.key, required this.id});

  @override
  State<DetailsWidget> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wonder Woman'),
      ),
      body: ListView(
        children: [
          DetailsMainInfoWidget(),
        ],
      ),
    );
  }
}
