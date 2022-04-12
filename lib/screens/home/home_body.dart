import 'package:ecommerce/screens/home/offer_product.dart';
import 'package:flutter/material.dart';

import '../search/search_screen.dart';
import 'best_product_details_screen.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //search
              TextField(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SearchScreen()));
                },
                readOnly: true,
                decoration: const InputDecoration(
                  hintText: "Enter anything to search...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //popular product
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Popular Product",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  TextButton(onPressed: () {}, child: const Text("View All")),
                ],
              ),
              // Container(
              //   padding: const EdgeInsets.all(20),
              //   decoration: const BoxDecoration(
              //     color: Colors.red,
              //     shape: BoxShape.circle,
              //   ),
              //   child: const Icon(
              //     Icons.ac_unit,
              //     color: Colors.white,
              //   ),
              // ),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: List.generate(
                  8,
                  (index) => Column(
                    children: const [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuGBqRXcDjsrmWgt-RHRk1PD3SVGMdKz8gPQ&usqp=CAU",
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Shirt",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //popular product
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Offer Product",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  TextButton(onPressed: () {}, child: const Text("View All")),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const OfferProduct()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 150,
                        padding: const EdgeInsets.all(
                          20,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.red, Colors.purple],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.white,
                              child: Image.network(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuGBqRXcDjsrmWgt-RHRk1PD3SVGMdKz8gPQ&usqp=CAU"),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Sport Bike",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              //best product
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Best Product",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  TextButton(onPressed: () {}, child: const Text("View All")),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const BestProductDetailsScreen()));
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.shop_two,
                                  size: 50,
                                ),
                                Text(
                                  "Favourite $index",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      "Rs.2400",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Rs.2800",
                                      style: TextStyle(
                                        color: Colors.red,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Text(
                          "Cotton Pants (Male)",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
