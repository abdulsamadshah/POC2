import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getxbase/Modules/homescreen/mycart.dart';
import 'package:getxbase/Modules/homescreen/noorder.dart';
import 'package:getxbase/Modules/homescreen/profiledetails.dart';
import 'package:getxbase/login.dart';
import 'categoryDetails.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

final int _currentIndex = 0;

class _CategoryState extends State<Category> {
  final List<Widget> _pages = [
    const Category(),
    const NoOrder(),
    const Mycart(),
    const Profiledetails(),
  ];

  // Method to handle BottomNavigationBar item taps and navigate
  void _onItemTapped(int index) {
    // Use Navigator.push to push a new route when a tab is tapped
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Category()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const NoOrder()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Mycart()));
        break;
      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Profiledetails()));
        break;
    }
  }

  final CollectionReference categories =
      FirebaseFirestore.instance.collection("categories");

  String selectedCategoryId = '';
  bool isSearching = false;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();

    //------------- get selectedCategoryId ----------- //
    // categories.snapshots().first.then((snapshot) {
    //   if (snapshot.docs.isNotEmpty) {
    //     setState(() {
    //       selectedCategoryId = snapshot.docs.first.id;
    //     });
    //   }
    // });

    categories.snapshots().first.then((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        setState(() {
          selectedCategoryId = snapshot.docs.first.id;
        });
      } else {
        setState(() {
          selectedCategoryId = ''; // No categories found
        });
      }
    });
  }

  void _toggleSearch() {
    setState(() {
      isSearching = !isSearching;
      if (!isSearching) {
        searchQuery = '';
      }
    });
  }

  Future<void> logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginForm()),
      );
    } catch (e) {
      // Handle error
      print("Error signing out: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error signing out. Please try again.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex, // This controls which tab is active
          onTap: _onItemTapped, // This calls the _onItemTapped function
          showSelectedLabels: false, // Hides selected label
          showUnselectedLabels: false, // Hides unselected labels
          backgroundColor: Colors.red,
          selectedItemColor: Colors.orange,
          unselectedItemColor: const Color(0xffC2C2C2),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home', // Label is required
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: '', // Label is required
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: '', // Label is required
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '', // Label is required
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Banner Section
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/food-banner.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100, left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.location_on, color: Colors.white),
                              SizedBox(width: 8.0),
                              Text(
                                'New York City',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: _toggleSearch,
                                child: Container(
                                  margin: const EdgeInsets.all(1.0),
                                  child: Image.asset(
                                    'assets/images/search.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(1.0),
                                child: Image.asset(
                                  'assets/images/notification.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  logout(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 1)),
                                  child: Icon(
                                    Icons.logout,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Profiledetails(),
                                      ));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 1)),
                                  child: Icon(
                                    Icons.account_circle,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Display search field if searching
                    if (isSearching)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              searchQuery = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Search for products...",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon: const Icon(Icons.search),
                          ),
                        ),
                      ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 340,
                          padding: const EdgeInsets.all(15.0),
                          child: const Column(
                            children: <Widget>[
                              Text(
                                'Provide the best food for you',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Find by Categorys',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xffFE8C00),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: StreamBuilder<QuerySnapshot>(
                  stream: categories.snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (streamSnapshot.hasError) {
                      return const Center(child: Text("Error fetching data"));
                    }
                    if (streamSnapshot.hasData) {
                      final docs = streamSnapshot.data!.docs;

                      return SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: docs.length,
                          itemBuilder: (context, index) {
                            var categoryName = docs[index]['categoryName'] ??
                                'No category name';
                            String categoryId = docs[index].id;

                            bool isSelected = selectedCategoryId == categoryId;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCategoryId = categoryId;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: CategoryItem(
                                  image: 'assets/images/taco.png',
                                  title: categoryName,
                                  backgroundColor: isSelected
                                      ? const Color(0xFFFF8C00)
                                      : Colors.white,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return const Center(child: Text("No data available"));
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),

          SizedBox(
            height: 300,
            child: selectedCategoryId.isEmpty
                ? const Center(child: Text("Please select a category"))
                : StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("fooditems")
                  .doc(selectedCategoryId)
                  .collection("products")
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(child: Text("Error loading products"));
                }
                if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                  final filteredDocs = snapshot.data!.docs.where((doc) {
                    final title = doc['title']?.toString().toLowerCase() ?? '';
                    return title.contains(searchQuery.toLowerCase());
                  }).toList();

                  if (filteredDocs.isEmpty) {
                    return const Center(child: Text("No products found"));
                  }

                  return GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 3 / 4,
                    ),
                    itemCount: filteredDocs.length,
                    itemBuilder: (context, index) {
                      var productDoc = filteredDocs[index];
                      String imagePath = 'assets/images/burger1.png';
                      var title = productDoc['title'] ?? 'Food Item';
                      var price = productDoc['price'] ?? 'Unknown';
                      var star = productDoc['star'] ?? 'N/A';
                      var distance = productDoc['distance'] ?? 'N/A';
                      var description =
                          productDoc['desc'] ?? 'No description';

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryDetails(
                                data: productDoc,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  imagePath,
                                  width: double.infinity,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Price: \$$price",
                                  style: const TextStyle(fontSize: 14),
                                ),
                                Text(
                                  "Rating: $star",
                                  style: const TextStyle(fontSize: 14),
                                ),
                                Text(
                                  "Distance: $distance",
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("No products available"));
                }
              },
            ),
          ),

          // SizedBox(
              //   height: 300,
              //   child: StreamBuilder<QuerySnapshot>(
              //     stream: FirebaseFirestore.instance
              //         .collection("fooditems")
              //         .doc(selectedCategoryId)
              //         .collection("products")
              //         .snapshots(),
              //     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return const Center(child: CircularProgressIndicator());
              //       }
              //       if (snapshot.hasError) {
              //         return const Center(
              //             child: Text("Error loading products"));
              //       }
              //       if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              //         final filteredDocs = snapshot.data!.docs.where((doc) {
              //           final title =
              //               doc['title']?.toString().toLowerCase() ?? '';
              //           return title.contains(searchQuery.toLowerCase());
              //         }).toList();
              //
              //         if (filteredDocs.isEmpty) {
              //           return const Center(child: Text("No products found"));
              //         }
              //
              //         return GridView.builder(
              //           gridDelegate:
              //               const SliverGridDelegateWithFixedCrossAxisCount(
              //             crossAxisCount: 2,
              //             crossAxisSpacing: 10,
              //             mainAxisSpacing: 10,
              //             childAspectRatio: 3 / 4,
              //           ),
              //           itemCount: filteredDocs.length,
              //           itemBuilder: (context, index) {
              //             var productDoc = filteredDocs[index];
              //             String imagePath = 'assets/images/burger1.png';
              //             var title = productDoc['title'] ?? 'Food Item';
              //             var price = productDoc['price'] ?? 'Unknown';
              //             var star = productDoc['star'] ?? 'N/A';
              //             var distance = productDoc['distance'] ?? 'N/A';
              //             var description =
              //                 productDoc['desc'] ?? 'No description';
              //
              //             return InkWell(
              //               onTap: () {
              //                 Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                     builder: (context) => CategoryDetails(
              //                       data: productDoc,
              //                     ),
              //                   ),
              //                 );
              //               },
              //               child: Card(
              //                 shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(15),
              //                 ),
              //                 elevation: 4,
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(12.0),
              //                   child: Column(
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       Image.asset(
              //                         imagePath,
              //                         width: double.infinity,
              //                         height: 100,
              //                         fit: BoxFit.cover,
              //                       ),
              //                       const SizedBox(height: 8),
              //                       Text(
              //                         title,
              //                         style: const TextStyle(
              //                           fontSize: 16,
              //                           fontWeight: FontWeight.bold,
              //                         ),
              //                         maxLines: 1,
              //                         overflow: TextOverflow.ellipsis,
              //                       ),
              //                       const SizedBox(height: 8),
              //                       Text(
              //                         "Price: \$$price",
              //                         style: const TextStyle(fontSize: 14),
              //                       ),
              //                       Text(
              //                         "Rating: $star",
              //                         style: const TextStyle(fontSize: 14),
              //                       ),
              //                       Text(
              //                         "Distance: $distance",
              //                         style: const TextStyle(fontSize: 14),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             );
              //           },
              //         );
              //       } else {
              //         return const Center(child: Text("No products available"));
              //       }
              //     },
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String image;
  final String title;
  final Color backgroundColor;

  const CategoryItem({
    required this.image,
    required this.title,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 40,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
