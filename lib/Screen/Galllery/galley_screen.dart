import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../constants.dart';

class GalleryScreen extends StatefulWidget {

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<GalleryScreen> {
  var _fireStoreInstance = FirebaseFirestore.instance;
  List items = [];

  fetchItem() async {
    QuerySnapshot qn = await _fireStoreInstance.collection("Items").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        items.add(
            {
              "userEmail": qn.docs[i]["userEmail"],
              "title": qn.docs[i]["title"],
              "price": qn.docs[i]["price"],
              "imageURL": qn.docs[i]["imageURL"],
              "desc": qn.docs[i]["desc"],
              "quantity": qn.docs[i]["quantity"],


            });
      }
    });

    // return list;
  }

  void initState() {
    super.initState();
    fetchItem();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
          body: GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 1),
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    color: itemCardColor,
                    elevation: 16,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // AspectRatio(aspectRatio: 2, child: Image.network(items[index]["imageURL"][0],
                        //   fit: BoxFit.fitHeight,
                        // ),
                        // ),
                        AspectRatio(
                            aspectRatio: 2,
                            child: Image.network(items[index]["imageURL"].toString())
                          // Image.asset(
                            //   'assets/images/dumy.jpg',
                            //   fit: BoxFit.fitWidth,
                            // )
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),

                          child: Text(
                            "${items[index]["title"]}",
                            style: TextStyle(color: textColor1.withOpacity(1.0),
                                fontWeight: FontWeight.bold,
                                fontSize: 25
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text("Min Bid: "
                                  "${items[index]["price"].toString()}"" Tk",
                                style: TextStyle(color: textColor1),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text("Quantity : "
                                  "${items[index]["quantity"].toString()}",
                                style: TextStyle(color: textColor1),
                              ),
                            )
                          ],
                        )
                        ,
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text("Bid End : "
                              "07/11/2021",
                            style: TextStyle(color: textColor1),
                          ),
                        ),
                        ButtonBar(
                          children: [
                            ElevatedButton(
                              child: Text('Favourite'),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: itemInsideFlutButtonColor,
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                  textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                            ElevatedButton(
                              child: Text('Bid'),
                              onPressed: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetails(items[index])));
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: itemInsideFlutButtonColor,
                                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                                  textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),

                            // FlatButton(
                            //   color: CustomColors.itemInsideFlutButtonColor,
                            //   child: const Text('Bid'),
                            //   onPressed: () {/* ... */},
                            // )
                          ],
                        )
                      ],
                    ),
                  ),
                )
                //
                    ;
              }),
        );
  }
}
