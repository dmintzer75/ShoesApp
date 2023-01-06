import 'package:flutter/material.dart';

class ShoeDesc extends StatelessWidget {
  const ShoeDesc({super.key, required this.title, required this.description});
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            description,
            style: TextStyle(color: Colors.grey[700], height: 1.8),
          )
        ],
      ),
    );
  }
}
