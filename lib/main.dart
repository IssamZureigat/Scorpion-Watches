import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List myImages = [
    Image(
        image: NetworkImage(
            "https://atlanticwatches.ch/wp-content/uploads/2021/12/Watches-for-Her.png")),
    Image(
        image: NetworkImage(
            "https://monochrome-watches.com/wp-content/uploads/2022/05/Vacheron-Constantin-Overseas-Perpetual-Calendar-Ultra-Thin-Skeleton-Blue-1.jpg")),
    Image(
        image: NetworkImage(
            "https://www.vacheron-constantin.com/dam/ric-import/vac/abb5/d8b1/2177264.jpeg.transform.vacrect.jpg")),
    Image(
        image: NetworkImage(
            "https://cdn11.bigcommerce.com/s-uok04hg6nb/images/stencil/1280w/carousel/30/Formex_Essence_LEGGERA_Automatic_Chronometer_1.jpg?c=1"))
  ];
  List wNames = ["Atlantic", "Skeletonized", "Luxury", "FORMEX"];

  List oldPrice = ["580\$", "720\$", "430\$", "676\$"];
  List newPrice = [
    "499\$",
    "599\$",
    "299\$",
    "599\$",
  ];
  String myText = "";
  String favtext = "";
  List ooo = [false, false, false, false];
  List cart = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(backgroundColor: Color.fromARGB(255, 71, 56, 51)),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.brown, Colors.black])),
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {
                          bool value = cart[i];
                          setState(() {
                            cart[i] = !value;
                          });
                        },
                        icon: Icon(Icons.plus_one),
                        label: Text("Add to cart")),
                    ListTile(
                        title:
                            Column(
                              children: [
                                Text(
                                  "${wNames[i]}",
                                  style:
                                      TextStyle(color: Colors.white, fontSize: 20),
                                ),
                             
                            Column(
                              children: [
                                Visibility(
                                  child: Text("Added to cart",style: TextStyle(color: Colors.amber, fontSize: 30),),
                                  visible: cart[i],
                                ),
                                Visibility(
                                  child: Text("added to favor",style: TextStyle(color: Colors.pink, fontSize: 30)),
                                  visible: ooo[i],
                                )
                              ],
                            ) ],
                            ),
                      
                        subtitle: Row(
                          children: [
                            Text("${oldPrice[i]}",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    decoration: TextDecoration.lineThrough)),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${newPrice[i]}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            
                          ],
                        ),
                        leading: myImages[i],
                        trailing: ElevatedButton(
                            onPressed: () {
                              bool value = ooo[i];
                              setState(() {
                                ooo[i] = !value;
                              });
                            },
                            child: Icon(Icons.favorite))),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
