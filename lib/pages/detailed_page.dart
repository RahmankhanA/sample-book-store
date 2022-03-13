import 'package:book_store/data/json.dart';
import 'package:book_store/widgets/book_card.dart';
import 'package:book_store/widgets/book_detail.dart';
import 'package:book_store/widgets/book_title.dart';
import 'package:flutter/material.dart';

class DetailedPage extends StatelessWidget {
  const DetailedPage({Key? key, required this.id}) : super(key: key);
  final int id;
  

  @override
  Widget build(BuildContext context) {
    
   var  bookDetail= popularBooks[id-1];
  var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff465bd8),
      appBar: AppBar(
        title: MarqueeWidget(
          child: Text(
            bookDetail['title'].toString(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          color: Color(0xff465bd8),
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$" + bookDetail['ori_price'].toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15.0),
            ),
            TextButton(
              onPressed: () {
                // cartController.addToCart(item);
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.add_shopping_cart_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Add to cart",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                overlayColor: MaterialStateProperty.all(Colors.blue),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          width: double.infinity,
          child: Column(
            children: [
              Image.network(
                bookDetail['image'].toString(),
                width: size.width / 2,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft, child: Text(bookDetail['publisher'].toString())),
              const SizedBox(
                height: 10,
              ),
              Text(
                bookDetail['title'].toString(),
                style:
                    const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_border_rounded,
                    color: Colors.amber,
                  ),
                  Text(bookDetail['rating'].toString()),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Text(
                bookDetail['long_desc'].toString(),
                style: const TextStyle(fontSize: 20.0),
              ),
            
              const MyCenterTitle(
                title: "Recommended Item's",
                horizentalPadding: 40.0,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: getBooks(),
                
              )
            ],
          ),
        ),
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
