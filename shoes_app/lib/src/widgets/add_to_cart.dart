// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'custom_widgets.dart';

class AddToCart extends StatelessWidget {
  const AddToCart(
      {super.key,
      required this.text,
      required this.amount,
      this.backgroundColor = const Color(0xffECE8DD),
      this.height = 80});
  final double amount;
  final Color backgroundColor;
  final String text;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$$amount',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Bounce(
            delay: Duration(milliseconds: 500),
            from: 10,
            child: CartButton(
              text: text,
            ),
          )
        ],
      ),
    );
  }
}
