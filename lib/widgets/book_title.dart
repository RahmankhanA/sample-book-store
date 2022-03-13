import 'package:flutter/material.dart';

class MyCenterTitle extends StatelessWidget {
  const MyCenterTitle({Key? key, required this.title,required this.horizentalPadding}) : super(key: key);
  final String title;
  final double horizentalPadding;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
                height: 25,
              ),
        Center(
          child: Container(
            padding:  EdgeInsets.symmetric(vertical: 10, horizontal: horizentalPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.deepOrange,
            ),
            child: Text(
              title.toString(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(
                height: 25,
              ),
      ],
    );
  }
}
