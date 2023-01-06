// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class ShoePageMobile extends StatelessWidget {
  const ShoePageMobile({super.key});
  @override
  Widget build(BuildContext context) {
    changeStatusDark();
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(text: 'For you'),
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
          AddToCart(text: 'Add to Cart', amount: 180)
        ],
      ),
    );
  }
}
