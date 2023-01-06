import 'package:flutter/material.dart';
import 'package:shoes_app/src/responsive/responsive_layout.dart';
import 'src/pages/shoe_page_desktop.dart';
import 'src/pages/shoe_page_mobile.dart';
import 'src/pages/shoe_details_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: ShoePageMobile(),
      desktopBody: ShoePageDesktop(),
    );
  }
}
