import 'package:flutter/material.dart';
import 'main.dart';

class cartpage extends StatefulWidget {
  cartpage({super.key});

  @override
  State<cartpage> createState() => _cartpageState();
}

class _cartpageState extends State<cartpage> {
  double delivary = 5.50;
  double tax=14.28;

  @override
  Widget build(BuildContext context) {
    double subtotal = subtotalprice();
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      bottomNavigationBar: Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          color: Color(0xffFFFFFF),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    "Delivary",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 230),
                  child: Text(
                    "\$$delivary",
                    style: TextStyle(
                        color: Color(0xffADAEAF),
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 1.9,
                width: 390,
                color: Color(0xffADAEAF),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15),
                  child: Text(
                    "Tax(12%)",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 225),
                  child: Text(
                    "\$$tax",
                    style: TextStyle(
                        color: Color(0xffADAEAF),
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 1.9,
                width: 390,
                color: Color(0xffADAEAF),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Text(
                    "Total",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 260),
                  child: Text(
                    "\$${subtotal + delivary+tax}",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 1.9,
                width: 390,
                color: Color(0xffADAEAF),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 70,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xffDF1D38)),
                child: Center(
                    child: Text(
                  "Order Now",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                )),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 50, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/");
                    },
                    child: Icon(
                      Icons.menu_rounded,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: cartlist.map((e) {
                return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 110,
                      width: 380,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.transparent,
                          border: Border.all(width: 2, color: Colors.grey)),
                      child: Row(children: [
                        Image.network(
                          e["img"] ?? "",
                          height: 68,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e["name"],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  e["nam"],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 95),
                                      child: Text(
                                        "\$" + e["price"].toString(),
                                        style: TextStyle(
                                            color: Color(0xffDF1D38),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        border: Border.all(
                                            color: Color(0xffDF1D38)),
                                        color: Colors.transparent,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          if (e["qty"] > 1) {
                                            e["qty"] = e["qty"] - 1;
                                            setState(() {});
                                          } else {
                                            cartlist.remove(e);
                                            setState(() {});
                                          }
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          size: 15,
                                          color: Color(0xffDF1D38),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10),
                                      child: Text(
                                        e["qty"].toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10),
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          color: Color(0xffDF1D38),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            e["qty"] = e["qty"] + 1;
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
                              ]),
                        ),
                      ]),
                    ));
              }).toList(),
            )
          ],
        ),
      ),
    );
  }

  double subtotalprice() {
    double subtotal = 0;
    cartlist.forEach((e) {
      subtotal += e["qty"] * e["price"];
    });
    return subtotal;
  }
}
