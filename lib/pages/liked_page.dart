import 'package:book_store/data/json.dart';
import 'package:book_store/theme/colors.dart';
import 'package:book_store/widgets/appBar_row.dart';

import 'package:flutter/material.dart';

class LikedPage extends StatefulWidget {
  const LikedPage({Key? key}) : super(key: key);

  @override
  State<LikedPage> createState() => _LikedPageState();
}

class _LikedPageState extends State<LikedPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    num totalprice = 0;
    for (var element in popularBooks) {
      totalprice = totalprice + num.parse(element["ori_price"].toString());
    }
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        elevation: 0,
        title: const MyAppBarRow(),
      ),
      body: popularBooks.isEmpty
            ? const Center(
                child: Text("Empty"),
              )
            : ListView.builder(
                itemCount: popularBooks.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 5, right: 10),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [
                              Color(0xFFFFFFFF),
                              Color(0xB0E7E9E7),
                            ],
                            begin: Alignment(0.2, 0.0),
                            end: Alignment(1.0, 0.0),
                            tileMode: TileMode.clamp),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        Image.network(
                          popularBooks[index]["image"].toString(),
                          width: size.width / 4,
                          height: size.width / 4,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(popularBooks[index]["title"].toString()),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                   " \$"+ popularBooks[index]["ori_price"].toString() 
                                        ,
                                    style: const TextStyle(
                                        fontSize: 12.0,
                                        color: Color(0xff465bd8),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  FloatingActionButton(
                                    backgroundColor: const Color(0xff465bd8),
                                    onPressed: () {
                                      // controller
                                      //     .deleteItem(controller.items[index]);
                                    },
                                    // ignore: prefer_const_constructors
                                    child: Icon(
                                      Icons.delete_outline_sharp,
                                      size: 25,
                                    ),
                                    mini: true,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    heroTag: null,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
     
    );
  }
 
}
