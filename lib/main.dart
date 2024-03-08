import 'package:flutter/material.dart';

import 'cart_page.dart';
import 'food_detail.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/": (context) => Fastfood(),
      "food_detail": (context) => Fooddetail(),
      "cart_page": (context) => cartpage(),
    },
  ));
}

class Fastfood extends StatefulWidget {
  const Fastfood({super.key});

  @override
  State<Fastfood> createState() => _FastfoodState();
}

class _FastfoodState extends State<Fastfood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 70, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xffFEFEFE),
                    ),
                    child: Icon(
                      Icons.menu_rounded,
                      size: 30,
                    ),
                  ),
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xffFEFEFE),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "cart_page");
                      },
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 35, left: 20),
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xffFFFFFF)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Icon(
                          Icons.search_rounded,
                          color: Color(0xff8D8D8D),
                          size: 25,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 100),
                        child: Text("Search something",
                            style: TextStyle(
                                color: Color(0xffEAEAEA), fontSize: 18)),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  width: 55,
                  margin: EdgeInsets.only(top: 35, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xffFEFEFE),
                  ),
                  child: Icon(
                    Icons.sync_alt_outlined,
                    size: 30,
                    color: Color(0xff8D8D8D),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 200,
                  width: 380,
                  color: Colors.black,
                  child: Image.network(
                    "https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/vegetarian-diet-plan-1296x728-feature.jpg?w=1155&h=1528",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text("Choose Food",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w500)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20),
                  child: Text(
                    "See All",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: foodlist.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, top: 15),
                    child: Food1(
                      img: e["img"],
                      name: e["name"],
                    ),
                  );
                }).toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text("Recommended",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w500)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20),
                  child: Text(
                    "See All",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: foodlist1.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, top: 15),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "food_detail",
                            arguments: e);
                      },
                      child: Food2(
                        img: e["img"],
                        name: e["name"],
                        price: e["price"],
                        nam: e["nam"],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: foodlist2.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, top: 15),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "food_detail",
                            arguments: e);
                      },
                      child: Food2(
                        img: e["img"],
                        name: e["name"],
                        price: e["price"],
                        nam: e["nam"],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Food1 extends StatelessWidget {
  String? name;
  String? img;

  Food1({Key? key, this.name, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Column(
        children: [
          Container(
            height: 140,
            width: 140,
            color: Colors.black,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4),
                BlendMode.srcOver,
              ),
              child: Image.network(
                img ?? "",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 40,
            width: 140,
            color: Color(0xff3C3F41),
            child: Center(
              child: Text(
                name ?? "",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Food2 extends StatelessWidget {
  String? name;
  String? nam;
  String? img;
  double? price;

  Food2({Key? key, this.name, this.nam, this.img, this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
              height: 240,
              width: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xffF4F4F4)),
              child: Column(children: [
                Image.network(
                  img ?? "",
                  height: 130,
                  width: 150,
                ),
                Text(name??"",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                Text(nam??"",style: TextStyle(fontSize: 15)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 20),
                      child: Text("\$$price",style: TextStyle(color: Color(0xffDF1D38),fontSize: 20,fontWeight: FontWeight.w500),),
                    ),
                    Container(
                      height: 60,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Color(0xffDF1D38),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                    ),
                    child: Icon(Icons.add,color: Colors.white,),
                    )
                  ],
                ),
              ])),
        ),
      ],
    );
  }
}

List<Map> foodlist = [
  {
    "name": "Newest",
    "img":
        "https://ophpoway.com/wp-content/uploads/Fresh-Strawberry-Crepes.jpg",
  },
  {
    "name": "Popular",
    "img":
        "https://www.goindigo.in/content/dam/indigov2/6e-website/destinations/get-inspired/food-tripping/Makke-di-Roti.jpg",
  },
  {
    "name": "Trending",
    "img":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEZH9AEPWZwNATTZUwku5Rs34gSmabSRbTcGG1klR-3mC86axgdsazrVEeQdfoR5MJaKs&usqp=CAU",
  },
  {
    "name": "organic",
    "img": "https://static.toiimg.com/photo/92575133.cms",
  },
];

List<Map> foodlist1 = [
  {"name": "Double Burger", "nam": "Double Beef", "img": "https://freepngimg.com/download/burger/159187-burger-double-cheese-free-png-hq.png", "price": 7.50,"qty":1},
  {"name": "Beef Burger", "nam": "Double Beef", "img": "https://cdn.pixelbin.io/v2/dummy-cloudname/erase.bg(shadow:true)~t.resize(w:345)/__editor/__erase_bg/2024-3-10/1kBBYKecoPoJgaSA_zTwD?download=true", "price": 15.50,"qty":1}
];
List<Map> foodlist2 = [
  {"name": "Pizza", "nam": "Bacon Pizza", "img": "https://cdn.pixelbin.io/v2/dummy-cloudname/erase.bg(shadow:true)~t.resize(w:405)/__editor/__erase_bg/2024-3-10/4UJHEJFfiKdKA55NDPoT5?download=true", "price": 16.50,"qty":1},
  {"name": "Sandwich", "nam": "Cheese Sandwich", "img": "https://cdn.pixelbin.io/v2/dummy-cloudname/erase.bg(shadow:true)~t.resize(w:209)/__editor/__erase_bg/2024-3-10/Uh0mdtAvOdgF-4UL9a9n3?download=true", "price": 25.50,"qty":1}
];

List<Map> cartlist=[];