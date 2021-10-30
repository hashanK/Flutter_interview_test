import 'package:flutter/material.dart';
import 'package:flutter_interview_test/services/api_service.dart';
import 'package:flutter_interview_test/custom_widgets/category_button.dart';
import 'package:flutter_interview_test/custom_widgets/product_item_card.dart';

import '../models/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DioClient _client = DioClient();

  @override
  void initState() {
    super.initState();
  }

  final buttonList = [
    CategoryButton(
      title: 'All Product',
      isSelected: false,
    ),
    CategoryButton(
      title: 'Popular',
      isSelected: false,
    ),
    CategoryButton(
      title: 'Recent',
      isSelected: false,
    ),
    CategoryButton(
      title: 'Product',
      isSelected: false,
    ),
    CategoryButton(
      title: 'Product',
      isSelected: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: const [
                Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.shopping_bag,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              width: 160,
              child: const Text(
                'Enjoy the world into virtual reality',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, height: 1.5),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 180,
                            child: Text(
                              'Improved Controller Design With Virtual Reality',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white70),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'Buy Now!',
                              style: TextStyle(color: Colors.blue),
                            ),
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: -8,
                  child: Image.asset(
                    'assets/images/vr.png',
                    width: 200,
                    height: 200,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 80,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  scrollDirection: Axis.horizontal,
                  itemCount: buttonList.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        height: 30,
                        child: buttonList[index]);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 250,
              child: FutureBuilder(
                future: _client.getProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
      
                  if (snapshot.hasData) {
                    List<Product> products = snapshot.data as List<Product>;
      
                    return ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 25,
                        );
                      },
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductItemCard(
                            index: index, productList: products);
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
