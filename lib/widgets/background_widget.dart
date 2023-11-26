import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key, this.body});

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade900.withOpacity(0.9),
            Colors.deepPurple.shade800,
            Colors.deepOrange.shade900.withOpacity(0.9),
          ],
        ),
      ),
      child: body,
    );
  }
}
