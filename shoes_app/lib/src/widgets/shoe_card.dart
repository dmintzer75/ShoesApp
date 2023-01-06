// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/shoe_model.dart';
import '../pages/shoe_details_mobile.dart';

class ShoeCard extends StatelessWidget {
  const ShoeCard({super.key, this.fullScreen = false});

  final bool fullScreen;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext) => ShoeDetailsPageMobile()),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: fullScreen ? 4 : 20, vertical: fullScreen ? 4 : 0),
        padding: EdgeInsets.fromLTRB(20, 2, 20, 20),
        height: fullScreen ? 360 : 400,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.amber[400],
          borderRadius: fullScreen
              ? BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                )
              : BorderRadius.circular(40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _ShoeImage(),
            if (!fullScreen) _ShoeSizes(),
          ],
        ),
      ),
    );
  }
}

class _ShoeSizes extends StatelessWidget {
  const _ShoeSizes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _ShoeSizeBox(7),
        _ShoeSizeBox(7.5),
        _ShoeSizeBox(8),
        _ShoeSizeBox(8.5),
        _ShoeSizeBox(9),
        _ShoeSizeBox(9.5),
      ],
    );
  }
}

class _ShoeSizeBox extends StatelessWidget {
  const _ShoeSizeBox(
    this.number,
  );
  final double number;

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    return GestureDetector(
      onTap: () {
        shoeModel.size = number;
      },
      child: Container(
        alignment: Alignment.center,
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: number == shoeModel.size ? Colors.orange[700] : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: number == shoeModel.size
                ? [
                    BoxShadow(
                      color: Colors.orange[600]!,
                      offset: Offset(6, 10),
                      blurRadius: 10,
                    )
                  ]
                : []),
        child: Text(
          '${number.toString().replaceAll('.0', '')}',
          style: TextStyle(
            color: number == shoeModel.size ? Colors.white : Colors.orange[700],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _ShoeImage extends StatelessWidget {
  const _ShoeImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    return Stack(
      children: [
        Positioned(
          top: 135,
          left: 10,
          child: Transform.rotate(
            angle: -0.5,
            child: Container(
              width: 250,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange[600]!,
                    offset: Offset(20, 20),
                    blurRadius: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
        Image.asset(
          shoeModel.imagePath,
          height: 280,
        ),
      ],
    );
  }
}
