import 'package:flutter/material.dart';
import 'package:hello/components/other_components.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({super.key});

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true, // Allow full screen for bottom sheet
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: SingleChildScrollView( // Enable scrolling within the bottom sheet
            child: MyComponents(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Modal'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showBottomSheet(context),
          child: const Text('Show Modal'),
        ),
      ),
    );
  }
}
