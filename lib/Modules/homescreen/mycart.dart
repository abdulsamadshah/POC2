import 'package:flutter/material.dart';
import 'package:getxbase/Modules/homescreen/profiledetails.dart';

class Mycart extends StatefulWidget {
  const Mycart({super.key});

  @override
  State<Mycart> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Mycart> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = true;
  bool isCheckeds = true;
  bool isPassVisible = true;
  bool _isVisible = true;
  bool _isVisibles = true;

  int number = 0; // Initialize number

  void incrementNumber() {
    setState(() {
      number += 1;
    });
  }

  void decrementNumber() {
    setState(() {
      if (number > 0) number -= 1; // Ensure it doesn't go below 0
    });
  }

  int numbers = 0; // Initialize number

  void incrementNumbers() {
    setState(() {
      numbers += 1;
    });
  }

  void decrementNumbers() {
    setState(() {
      if (numbers > 0) numbers -= 1; // Ensure it doesn't go below 0
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFFdfdfdf),
                                width: 1,
                              ),
                            ),
                            child: Image.asset(
                              'assets/images/back-left-icon.png',
                              width: 25,
                              height: 24,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        'My Cart',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Image.asset(
                        'assets/images/change-location.png',
                        width: 45,
                        height: 34,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Delivery Location',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF878787),
                      ),
                    ),
                    // const SizedBox(width: 72),
                    ElevatedButton(
                      onPressed: () {
                        // Action to perform on button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: const BorderSide(
                            color: Color(0xFFFE8C00),
                            width: 1,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Change Location',
                        style: TextStyle(
                          color: Color(0xFFFE8C00),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter discount code',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        // Action for "Apply Discount" button
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: const Text(
                        'Apply',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                _isVisible
                    ? Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFffffff),
                          border: Border.all(
                            color: const Color(0xFFdfdfdf), // Border color
                            width: 2, // Border width
                          ), // Background color
                          borderRadius: BorderRadius.circular(
                              10), // Optional: round corners
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26, // Shadow color
                              blurRadius: 0, // Shadow blur radius
                              // Shadow offset
                            ),
                          ],
                        ),
                        // padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!; // Toggle checkbox state
                                });
                              },
                              activeColor: const Color(0xFFFE8C00),
                              checkColor: Colors
                                  .white, // Color of the checkmark (inside the box)
                              fillColor: WidgetStateProperty.all(
                                  const Color(0xFFFE8C00)),
                            ),
                            const SizedBox(width: 0),
                            Image.asset(
                              'assets/images/burger1.png',
                              width: 127,
                              height: 106,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 20),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Burger With Meat',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  '\$ 12,230',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFFE8C00),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ElevatedButton(
                                      onPressed: decrementNumbers,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors
                                            .transparent, // Set the button background to transparent
                                        shadowColor:
                                            Colors.transparent, // Remove shadow
                                        elevation: 1, // Remove elevation
                                        shape: const CircleBorder(
                                          side: BorderSide(
                                              color: Color(0xff878787),
                                              width:
                                                  1), // Circular border color and width
                                        ),
                                      ),
                                      child: const Text(
                                        '-',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 0),
                                    Text(
                                      '$numbers',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    ElevatedButton(
                                      onPressed: incrementNumbers,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors
                                            .transparent, // Set the button background to transparent
                                        shadowColor:
                                            Colors.transparent, // Remove shadow
                                        elevation: 0, // Remove elevation
                                        shape: const CircleBorder(
                                          side: BorderSide(
                                              color: Color(0xff878787),
                                              width:
                                                  1), // Circular border color and width
                                        ),
                                      ),
                                      child: const Text(
                                        '+',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isVisible =
                                              false; // Hide the Row when image is clicked
                                        });
                                      },
                                      child: Image.asset(
                                        'assets/images/delete.png',
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(height: 30),
                _isVisibles
                    ? Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFffffff),
                          border: Border.all(
                            color: const Color(0xFFdfdfdf), // Border color
                            width: 2, // Border width
                          ), // Background color
                          borderRadius: BorderRadius.circular(
                              10), // Optional: round corners
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26, // Shadow color
                              blurRadius: 0, // Shadow blur radius
                              // Shadow offset
                            ),
                          ],
                        ),
                        // padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: isCheckeds,
                              onChanged: (bool? value) {
                                setState(() {
                                  isCheckeds = value!; // Toggle checkbox state
                                });
                              },
                              activeColor: const Color(0xFFFE8C00),
                              checkColor: Colors
                                  .white, // Color of the checkmark (inside the box)
                              fillColor: WidgetStateProperty.all(
                                  const Color(0xFFFE8C00)),
                            ),
                            // Change the color when checked

                            const SizedBox(width: 0),
                            Image.asset(
                              'assets/images/burger3.png',
                              width: 127,
                              height: 106,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Ordinary Burgers',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  '\$ 12,230',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFFE8C00),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: decrementNumber,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors
                                            .transparent, // Set the button background to transparent
                                        shadowColor:
                                            Colors.transparent, // Remove shadow
                                        elevation: 0, // Remove elevation
                                        shape: const CircleBorder(
                                          side: BorderSide(
                                              color: Color(0xff878787),
                                              width:
                                                  1), // Circular border color and width
                                        ),
                                      ),
                                      child: const Text(
                                        '-',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFFdfdfdf),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 0),
                                    Text(
                                      '$number',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    ElevatedButton(
                                      onPressed: incrementNumber,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors
                                            .transparent, // Set the button background to transparent
                                        shadowColor:
                                            Colors.transparent, // Remove shadow
                                        elevation: 0, // Remove elevation
                                        shape: const CircleBorder(
                                          side: BorderSide(
                                              color: Color(0xff878787),
                                              width:
                                                  1), // Circular border color and width
                                        ),
                                      ),
                                      child: const Text(
                                        '+',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isVisibles =
                                              false; // Hide the Row when image is clicked
                                        });
                                      },
                                      child: Image.asset(
                                        'assets/images/delete.png',
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(height: 50),
                const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(1.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Display the number
                          Text(
                            'Payment Summary',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20), // Add some spacing
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Items (3)',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF878787),
                                ),
                              ),
                              Text(
                                '\$ 48,900',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery Fee',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF878787),
                                ),
                              ),
                              Text(
                                'Free',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Discount',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF878787),
                                ),
                              ),
                              Text(
                                '-10,900',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFFE8C00),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF878787),
                                ),
                              ),
                              Text(
                                '38,000',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Profiledetails()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFE8C00),
                    minimumSize: const Size(350, 0),
                    alignment: Alignment.center,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 24,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Order Now',
                          style: TextStyle(
                            fontSize: 16,
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
      ),
    );
  }
}
