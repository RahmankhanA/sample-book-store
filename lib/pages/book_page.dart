import 'package:book_store/data/json.dart';
import 'package:book_store/pages/Category%20_book_page.dart';
import 'package:book_store/theme/colors.dart';
import 'package:book_store/widgets/appBar_row.dart';

import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return body();
  }

  Widget body() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
        title: const MyAppBarRow(),
      ),
      body: FutureBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (context, AsyncSnapshot<List<int>> snapshot) {
          if (booksCategory.isNotEmpty) {
            return Center(
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: booksCategory.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 5, right: 10),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [
                                Color(0xFFFFFFFF),
                                Color.fromARGB(14, 153, 153, 221),
                              ],
                              begin: Alignment(0.2, 0.0),
                              end: Alignment(1.0, 0.0),
                              tileMode: TileMode.clamp),
                          borderRadius: BorderRadius.circular(30)),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryWiseBook(category: booksCategory[index]['name'],)),
                            );
                          },
                          child:
                              Text(booksCategory[index]["name"].toString())));
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            );
          }
          return const CircularProgressIndicator();
        },
        // future: booksCategory.length,
      ),
    );
  }
}
