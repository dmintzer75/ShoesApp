// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../widgets/custom_widgets.dart';

class ShoePageDesktop extends StatelessWidget {
  const ShoePageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 300,
                // color: Colors.grey,
                child: CustomAppBar(text: 'For you'),
              ),
              Container(
                width: 300,
                child: AddToCart(text: 'Add to Cart', amount: 180),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Hero(
                    tag: 'shoe-1',
                    child: ShoeCard(),
                  ),
                  ShoeDesc(
                    title: 'Nike Air Max 720',
                    description:
                        'In Amet commodo anim cupidatat irure ea dolore irure anim. Ea adipisicing nisi reprehenderit do irure ut non occaecat eu cillum sunt Lorem pariatur eiusmod. Est Lorem ipsum elit id in dolor fugiat.',
                  ),
                  ShoeCard(),
                  ShoeDesc(
                    title: 'Nike Air Max 720',
                    description:
                        'In Amet commodo anim cupidatat irure ea dolore irure anim. Ea adipisicing nisi reprehenderit do irure ut non occaecat eu cillum sunt Lorem pariatur eiusmod. Est Lorem ipsum elit id in dolor fugiat.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
