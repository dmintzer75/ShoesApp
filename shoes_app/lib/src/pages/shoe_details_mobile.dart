// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import '../models/shoe_model.dart';
import '../widgets/custom_widgets.dart';

class ShoeDetailsPageMobile extends StatelessWidget {
  const ShoeDetailsPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    changeStatusLight();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: 'shoe-1',
                child: ShoeCard(
                  fullScreen: true,
                ),
              ),
              Positioned(
                top: 150,
                child: FloatingActionButton(
                  splashColor: Colors.transparent,
                  elevation: 0,
                  onPressed: () {
                    changeStatusDark();
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                    size: 70,
                  ),
                  backgroundColor: Colors.transparent,
                ),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ShoeDesc(
                    title: 'Nike Air Max 720',
                    description:
                        'In Amet commodo anim cupidatat irure ea dolore irure anim. Ea adipisicing nisi reprehenderit do irure ut non occaecat eu cillum sunt Lorem pariatur eiusmod. Est Lorem ipsum elit id in dolor fugiat.',
                  ),
                  AddToCart(
                    text: 'Buy now',
                    amount: 180,
                    height: 60,
                    backgroundColor: Colors.transparent,
                  ),
                  _Colors(),
                  _CartButtonsSettings()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CartButtonsSettings extends StatelessWidget {
  const _CartButtonsSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _SettingsButton(
            icon: Icons.favorite,
            iconColor: Colors.red,
          ),
          _SettingsButton(icon: Icons.shopping_cart),
          _SettingsButton(icon: Icons.settings),
        ],
      ),
    );
  }
}

class _SettingsButton extends StatelessWidget {
  const _SettingsButton({
    super.key,
    required this.icon,
    this.iconColor = const Color(0xffECE8DD),
  });
  final IconData icon;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(offset: Offset(3, 3), color: Colors.grey[400]!, blurRadius: 10),
        ],
      ),
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}

class _Colors extends StatelessWidget {
  const _Colors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 90,
                  child: _ColorButton(Colors.lightGreen[400]!, 4),
                ),
                Positioned(
                  left: 60,
                  child: _ColorButton(Colors.amber, 3),
                ),
                Positioned(
                  left: 30,
                  child: _ColorButton(Colors.blue[600]!, 2),
                ),
                _ColorButton(Colors.blueGrey[700]!, 1),
              ],
            ),
          ),
          CartButton(
            text: 'More related items',
            color: Color(0xffFFC675),
          )
        ],
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  const _ColorButton(
    this.color,
    this.index, {
    super.key,
  });
  final Color color;
  final int index;
  String getColor(int index) {
    switch (index) {
      case 1:
        return 'negro';
      case 2:
        return 'azul';
      case 3:
        return 'amarillo';
      case 4:
        return 'verde';
      default:
        return 'negro';
    }
  }

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context, listen: false);

    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          shoeModel.imagePath = 'assets/images/${getColor(index)}.png';
        },
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
      ),
    );
  }
}
