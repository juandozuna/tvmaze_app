import 'package:flutter/material.dart';

class ShowDetailPage extends StatefulWidget {
  const ShowDetailPage({Key? key}) : super(key: key);

  @override
  _ShowDetailPageState createState() => _ShowDetailPageState();
}

class _ShowDetailPageState extends State<ShowDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Detail'),
      ),
      body: Center(
        child: Text('Show Detail'),
      ),
    );
  }
}