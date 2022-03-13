import 'package:book_store/widgets/book_title.dart';
import 'package:flutter/material.dart';
import 'package:book_store/widgets/book_card.dart';
import 'package:book_store/widgets/top_block.dart';
import 'package:book_store/data/json.dart';

class MyStackBody extends StatelessWidget {
  const MyStackBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              const TopBlock(),
              Positioned(
                  top: 200,
                  left: 25,
                  right: 0,
                  
                  child: SizedBox(
                    height: 300,
                    child: getBooks(),
                  )),
            ],
          ),
          const SizedBox(
            height: 45,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyCenterTitle(
                title: "Latest Release",
                horizentalPadding: 80.0,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: getBooks(),
              ),
              const MyCenterTitle(
                title: "Popular books in your country",
                horizentalPadding: 40.0,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: getBooks(),
              ),
              const MyCenterTitle(
                title: "Best books to read this week ",
                horizentalPadding: 40.0,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: getBooks(),
              ),
              const MyCenterTitle(
                title: "Most liked books",
                horizentalPadding: 80.0,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: getBooks(),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }

  getBooks() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 5),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            popularBooks.length, (index) => BookCard(book: popularBooks[index])),
      ),
    );
  }
}
