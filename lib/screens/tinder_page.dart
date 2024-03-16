import 'package:flutter/material.dart';
import 'package:smart_kid/widgets/tinder_cards.dart';

class TinderScreen extends StatefulWidget {
  const TinderScreen({super.key});

  @override
  State<TinderScreen> createState() => _TinderScreenState();
}

class _TinderScreenState extends State<TinderScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SwipeExample(),
      ),
    );
  }
}
