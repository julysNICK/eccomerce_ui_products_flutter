import 'package:eccomerce_ui/products.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int selectedIndex = 0;
  List<String> categories = [
    "All",
    "Fruits",
    "Vegetables",
    "Dairy",
    "Bakery",
    "Meat",
    "Fish",
    "Drinks",
    "Snacks",
    "Others",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFE5E5E5),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 25,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.sort,
                    size: 35,
                    color: Color(0xff6bc58e),
                  ),
                  Text(
                    "StoreLorem",
                    style: GoogleFonts.montserrat(
                      color: const Color(0xff6bc58e),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(
                    Icons.shopping_cart,
                    size: 35,
                    color: Color(0xff6bc58e),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffffffff),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    labelText: 'Search',
                    labelStyle: GoogleFonts.montserrat(
                      color: Colors.grey.withOpacity(0.5),
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Color(0xff6bc58e),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Text(
                            categories[index],
                            style: GoogleFonts.montserrat(
                              color: selectedIndex == index
                                  ? const Color(0xff6bc58e)
                                  : Colors.grey.shade900,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? const Color(0xff6bc58e)
                                : Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: productsList.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (ctx, index) => list(ctx, index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget list(ctx, i) {
  Size size = MediaQuery.of(ctx).size;
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Material(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
      child: SizedBox(
        height: 195,
        width: size.width - 50,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 10,
                bottom: 10,
                right: 5,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xffe8f6ee),
                ),
                child: Image.network(
                  productsList[i].imageUrl,
                  width: 165,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    width: size.width / 2.6,
                    child: Text(
                      productsList[i].name,
                      softWrap: true,
                      style: GoogleFonts.montserrat(
                        color: const Color(0xff6bc58e),
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: size.width / 2.6,
                    height: 40,
                    child: Text(
                      productsList[i].desc,
                      softWrap: true,
                      style: GoogleFonts.montserrat(
                        color: Colors.grey.shade900,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          productsList[i].price,
                          style: const TextStyle(
                            color: Color(0xff6bc58e),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Material(
                              color: Colors.greenAccent,
                              elevation: 10,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              child: SizedBox(
                                height: 30,
                                width: 60,
                                child: Center(
                                  child: Text(
                                    "Buy",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
