import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getxbase/Modules/homescreen/mycart.dart';
// ignore: depend_on_referenced_packages
import 'package:carousel_slider/carousel_slider.dart';

class CategoryDetails extends StatefulWidget {
  QueryDocumentSnapshot data;

  CategoryDetails({super.key, required this.data});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int number = 1; // Initialize number

  void incrementNumber() {
    // Parse the stock quantity from widget data and ensure it's greater than 0
    int stockQty = int.parse(widget.data['stock_qty'].toString());

    if (number < stockQty) {
      setState(() {
        number += 1;
      });
    } else {
      Fluttertoast.showToast(msg: "Stock is not available");
    }
  }

  void decrementNumber() {
    // Ensure number does not go below 1
    if (number > 1) {
      setState(() {
        number -= 1;
      });
    } else {
      Fluttertoast.showToast(msg: "Minimum quantity is 1");
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/images/banner-burger.png',
      'assets/images/banner-burger.png',
      'assets/images/banner-burger.png',
    ];

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carousel Slider
              CarouselSlider(
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                ),
                items: imgList
                    .map((item) =>
                        Image.asset(item, fit: BoxFit.cover, width: 1000))
                    .toList(),
              ),
              const SizedBox(height: 20),

              // Title
              Text(
                widget.data['title'],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),

              // Price
              Text(
                '\$${widget.data['price']}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFE8C00),
                ),
              ),
              const SizedBox(height: 20),

              // Details (Star, Distance, Rating)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 24),
                  Text(
                    'Free Delivery',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF878787),
                    ),
                  ),
                  SizedBox(width: 40),
                  const Icon(Icons.star, color: Colors.orange, size: 24),
                  Text(
                    widget.data['distance'],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF878787),
                    ),
                  ),
                  const SizedBox(width: 40),
                  Icon(Icons.star, color: Colors.orange, size: 24),
                  Text(
                    widget.data['star'],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF878787),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Description
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF101010),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.data['title'],
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF878787),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Quantity Selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: decrementNumber,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: const Text(
                          '-',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '$number',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: incrementNumber,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: const Text(
                          '+',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '\$${double.parse(widget.data['price']) * number}',
                    style: const TextStyle(
                      fontSize: 24,
                      color: Color(0xffFE8C00),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Add to Cart Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Mycart(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFE8C00),
                  minimumSize: const Size(350, 0),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart, color: Colors.white, size: 24),
                      SizedBox(width: 8),
                      Text(
                        ' Add to Cart',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
