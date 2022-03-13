import 'package:book_store/data/json.dart';
import 'package:book_store/widgets/book_card.dart';
import 'package:book_store/widgets/book_cover.dart';
import 'package:book_store/widgets/book_detail.dart';

import 'package:flutter/material.dart';

class CategoryWiseBook extends StatelessWidget {
  const CategoryWiseBook({Key? key, required this.category}) : super(key: key);
  final category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 222, 231),
      appBar: AppBar(
        title: MarqueeWidget(
          child: Text(
          category.toString(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 74, 55, 182)),
      ),
body: Container(
  padding:  const EdgeInsets.symmetric(vertical: 10),
  child: Center(child :getBooks())),
    );
  }


  
  getBooks() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 5),
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
            popularBooks.length, (index) => BookCover(book: popularBooks[index])),
      ),
    );
  }
}