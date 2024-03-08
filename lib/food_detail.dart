import 'package:flutter/material.dart';
import 'main.dart';

class Fooddetail extends StatefulWidget {
  const Fooddetail({Key? key});

  @override
  State<Fooddetail> createState() => _FooddetailState();
}

class _FooddetailState extends State<Fooddetail> {
  Map? foodlist2;

  @override
  Widget build(BuildContext context) {
    foodlist2 = ModalRoute.of(context)?.settings.arguments as Map?;

    return Scaffold(
        backgroundColor: Color(0xffFAFAFA),
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Icon(
                Icons.arrow_back_ios,
                size: 30,
              ),
            ),
          ),
          title: Center(
              child: Text(
            "Details",
            style: TextStyle(fontSize: 22),
          )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Icon(
                Icons.favorite,
                color: Color(0xffDF1D38),
              ),
            )
          ],
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Container(
              height: 300,
              width: 300,
              child: Image.network(foodlist2?["img"] ?? "", height: 130),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 180),
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffDF1D38)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  height: 12,
                  width: 12,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  height: 12,
                  width: 12,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  foodlist2?["name"] ?? "",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 20),
                child: Text(
                  "\$${foodlist2?["price"]}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Color(0xffDF1D38)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 250, top: 30),
            child: Text(
              ("Ingeredients"),
              style: TextStyle(fontSize: 22),
            ),
          ),
          Row(
            children: fooduse.map((e) {
              return uses(
                use: e["use"],
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 250, top: 30),
            child: Text(
              ("Description"),
              style: TextStyle(fontSize: 22),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 58),
            child: RichText(
                text: TextSpan(
              children: [
                TextSpan(
                    text:
                        "This beef burger uses 100% quality beef with\nsliced tomatoes, cucumbers, vegetables and\nonions...",
                    style: TextStyle(
                        color: Color(0xffADAEAF),
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
                TextSpan(
                    text: "Read More",
                    style: TextStyle(
                        color: Color(0xffDF1D38),
                        fontSize: 15,
                        fontWeight: FontWeight.w500))
              ],
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              height: 80,
              width: 370,
              color: Colors.transparent,
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xffFFFFFF),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 13),
                          child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(5)),
                            color: Color(0xffF4F6F8),
                          ),
                          child: InkWell(
                            onTap: () {
                              if (  foodlist2?["qty"] > 1) {
                                foodlist2?["qty"] = foodlist2?["qty"] - 1;
                                setState(() {});
                              }
                            },
                            child: Icon(
                              Icons.remove,
                              size: 15,
                            ),
                          ),
                                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 13),
                          child: Center(
                              child: Text(
                                "${foodlist2?["qty"]}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 13),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Color(0xffDF1D38),
                            ),
                            child: InkWell(
                              onTap: () {
                                foodlist2?["qty"] = foodlist2?["qty"] + 1;
                                setState(() {});
                              },
                              child: Icon(
                                Icons.add,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 200,
                    margin: EdgeInsets.only(left: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xffDF1D38),
                    ),
                    child: Center(
                        child: InkWell(
                            onTap: () {
                              if(foodlist2 != null) {
                                cartlist.add(foodlist2!);
                              }
                              Navigator.pushNamed(context, "cart_page");
                            },
                            child: Text(
                              "Add To Cart",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ))),
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}

class uses extends StatelessWidget {
  String? use;

  uses({super.key, this.use});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18, top: 15),
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xffF4F4F4)),
            child: Center(
                child: Text(
              use ?? "",
              style: TextStyle(fontSize: 25),
            )),
          ),
        ),
      ],
    );
  }
}

List<Map> fooduse = [
  {"use": "🥖"},
  {"use": "🍅"},
  {"use": "🍔"},
  {"use": "🥪"},
  {"use": "🍟"},
];
