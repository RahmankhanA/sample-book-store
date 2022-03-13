
import 'package:book_store/theme/colors.dart';
import 'package:book_store/widgets/appBar_row.dart';
import 'package:flutter/material.dart';
import 'package:book_store/widgets/stackbody.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: primary,
        // backgroundColor: Colors.transparent,

        centerTitle: true,
        elevation: 0,
        title: const MyAppBarRow(),
      ),
      body:const MyStackBody(),
    );
  }
}
