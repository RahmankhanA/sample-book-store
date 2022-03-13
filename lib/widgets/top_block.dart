// ignore_for_file: prefer_const_constructors

import 'package:book_store/theme/colors.dart';
import 'package:book_store/widgets/search_widgets.dart';
import 'package:flutter/material.dart';

class TopBlock extends StatelessWidget {
  const TopBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
              color: primary),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 35, right: 15),
                child:  HeaderWithSearchBox(size: size,),
              ),
              const SizedBox(
                height: 10,
              ),
             
             
              Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: const Text(
                    "Popular Books",
                    style: TextStyle(
                        color: secondary,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        Container(
          height: 150,
          color: primary,
          child: Container(
            decoration: const BoxDecoration(
                color: appBgColor,
                borderRadius:
                    BorderRadius.only(topRight: Radius.circular(100))),
          ),
        )
      ],
    );
  }
}