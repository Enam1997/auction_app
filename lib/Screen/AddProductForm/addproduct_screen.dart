// import 'package:flutter/material.dart';
//
// class AddProoductScreen extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       body: Center(
//         child: Text("AddProoductScreen"),
//       ),
//     );
//   }
//
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../constants.dart';

class AddProoductScreen extends StatefulWidget {
  _AddProoductScreenState createState() => _AddProoductScreenState();
}

class _AddProoductScreenState extends State<AddProoductScreen> {
  final _user  = FirebaseAuth.instance.currentUser;
  final _keyForm = GlobalKey<FormState>();
  var xyz;

  final itemtitleController = TextEditingController();
  final itemDescriptionController = TextEditingController();
  final itemPriceController = TextEditingController();
  final itemQuantityController = TextEditingController();
  final imageURL = "https://picsum.photos/200";

  Future addData() async{
    final db =FirebaseFirestore.instance.collection("Items").add({
      'title': itemtitleController.text,
      'price': itemPriceController.text,
      'quantity': itemQuantityController.text,
      'desc': itemDescriptionController.text,
      'imageURL': imageURL,
      'userEmail': _user!.email,
    });
    print("data add Complete");
  }

  void initState() {

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
          body:
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 10,bottom: 10),
              child: Form(
                key: _keyForm,
                child: ListView(
                  children: [
                    Container(
                      child: InkWell(
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage("https://picsum.photos/200"),
                        ),
                      )
                    ),
                    SizedBox(height: 30,),
                    TextFormField(
                      maxLines: 5,
                      minLines: 2,
                      cursorColor: kPrimaryColor,
                      style: TextStyle(
                          color: textColor1
                      ),
                      controller: itemtitleController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onChanged: (v){xyz = v;},
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please enter item Title';
                        }else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: 'Enter Item Title',
                          hintStyle: TextStyle(
                              fontSize: 18,
                              color: textColor1
                          ),
                          enabledBorder: const OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderSide: const BorderSide(color: kPrimaryColor, width: 0.0,),
                            borderRadius: BorderRadius.all(Radius.circular(15.0),),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0))
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      maxLines: 5,
                      minLines: 2,
                      style: TextStyle(
                          color: textColor1
                      ),
                      controller: itemPriceController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      //maxLength: 11,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please enter item minimum price';
                        }else{
                          /*if(value.length == 11){
                          return null;
                        }else{
                          return 'Please enter minimum price getter than 0';
                        }*/

                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: 'Enter Minimum Price',
                          hintStyle: TextStyle(
                              fontSize: 18,
                              color: textColor1
                          ),
                          enabledBorder: const OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderSide: const BorderSide(color: kPrimaryColor, width: 0.0,),
                            borderRadius: BorderRadius.all(Radius.circular(15.0),),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0))
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      maxLines: 5,
                      minLines: 2,
                      style: TextStyle(
                          color: textColor1
                      ),
                      controller: itemQuantityController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please enter Quantity of product';
                        }else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: 'Enter Quantity',
                          hintStyle: TextStyle(
                              fontSize: 18,
                              color: textColor1
                          ),
                          enabledBorder: const OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderSide: const BorderSide(color: kPrimaryColor, width: 0.0,),
                            borderRadius: BorderRadius.all(Radius.circular(15.0),),
                          ),
                          border: OutlineInputBorder(

                              borderRadius: BorderRadius.all(Radius.circular(15.0),)
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      maxLines: 7,
                      minLines: 7,
                      style: TextStyle(
                          color: textColor1
                      ),
                      controller: itemDescriptionController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please enter item description';
                        }else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: 'Enter Item Description',
                          hintStyle: TextStyle(
                              fontSize: 18,
                              color: textColor1
                          ),
                          enabledBorder: const OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderSide: const BorderSide(color: kPrimaryColor, width: 0.0,),
                            borderRadius: BorderRadius.all(Radius.circular(15.0),),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0))
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: kPrimaryColor,
                            side: BorderSide(width:3, color:Colors.red),
                            elevation: 3,
                            padding: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)
                            )
                        ),
                        onPressed: (){
                          final isValid = _keyForm.currentState!.validate();
                          if (!isValid==true) {
                            print("Please Input Something ");
                          }
                          else
                          {
                            addData().then((value){
                              itemtitleController.clear();
                              itemDescriptionController.clear();
                              itemPriceController.clear();
                              itemQuantityController.clear();
                            });
                          }
                          _keyForm.currentState!.save();

                        },
                        child: Text('ADD'))
                  ],
                ),
              ),

            ),
          ),

        );
  }

}
