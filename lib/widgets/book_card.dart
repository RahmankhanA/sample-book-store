import 'dart:math';

import 'package:book_store/pages/detailed_page.dart';
import 'package:book_store/theme/colors.dart';
import 'package:flutter/material.dart';


import 'avatar_image.dart';

class BookCard extends StatelessWidget {
  const BookCard({Key? key, required this.book}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final book;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.4,
      height: size.height * 0.4,
      margin: EdgeInsets.only(right: size.width * 0.04),
      padding: EdgeInsets.only(
          left: size.width * 0.001,
          right: size.width * 0.01,
          top: size.height * 0.01,
          bottom: size.height * 0.002),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              color: Color(Random().nextInt(0xffffffff)).withAlpha(0xff),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(7),
              ),
              child: AvatarImage(
                book["image"],
                width: size.width * 0.19,
                height: size.height * 0.12,
                isSVG: false,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(book["title"],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16, color: primary, fontWeight: FontWeight.w600)),
          const SizedBox(
            height: 8,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: "\$${book["price"]}",
                  style: const TextStyle(
                      fontSize: 16,
                      color: primary,
                      fontWeight: FontWeight.w500)),
              const TextSpan(text: "   "),
              TextSpan(
                  text: "\$${book["ori_price"]}",
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.w500)),
            ]),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(Icons.add_shopping_cart_outlined),
              Icon(Icons.favorite_border_outlined),
            ],
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  DetailedPage(
                            id: book['id'],
                          )),
                );
              },
              child: const Text("More Info"))
        ],
      ),
    );
  }
}
