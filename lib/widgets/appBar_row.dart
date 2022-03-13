
import 'package:badges/badges.dart';
import 'package:book_store/data/json.dart';

import 'package:book_store/widgets/avatar_image.dart';
import 'package:flutter/material.dart';

class MyAppBarRow extends StatelessWidget {
  const MyAppBarRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
          child: Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: const [
                  Icon(
                    Icons.vertical_distribute_rounded,
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Text("Book Store"),
                ],
              ))),
     
      AvatarImage(profile, isSVG: false, width: 27, height: 27),
      const SizedBox(width: 20,),
      Badge(
                position: BadgePosition.topEnd(top: -10, end: -10),
                badgeContent: const Text(
                  '1',
                  style: TextStyle(color: Colors.white),
                ),
                child: const Icon(
                  Icons.shopping_bag_rounded,
                  color: Colors.white,
                ),
              ),
    ],
  );
  }
}