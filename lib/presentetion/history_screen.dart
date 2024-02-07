import 'package:algoocean_app/model/img_model.dart';
import 'package:algoocean_app/presentetion/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HistoryScreen extends StatefulWidget {


  String? name;
  List<String> commonList;
    HistoryScreen({super.key,this.name,required this.commonList});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  // Future<void> loadImagesLocally() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String>? storedImageUrls = prefs.getStringList('imageUrls');
  //   if (storedImageUrls != null) {
  //     setState(() {
  //       imageUrls = storedImageUrls;
  //     });
  //   }

  TextEditingController price=TextEditingController();
  List<dynamic> cartImgList=[];
    List<dynamic> value=[];






  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "History Screen",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
          ),
          backgroundColor: Colors.deepPurple,
        ),
      body: Padding(
        padding:   const EdgeInsets.only(top: 0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount:widget.commonList.length,
                 itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        // print("tapped...${widget.ImageUrl![index]}");
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Add Img To Cart"),
                                content:const Text("Are You sure You want to add to the card"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text("Add Price"),
                                                content:TextField(
                                                  keyboardType: TextInputType.number,
                                                  controller: price,
                                                ),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                         setState(() {
                                                             cartImgList.add(widget.commonList[index].toString());
                                                            value.add(price.text);
                                                           // List<ImageModel>imageList=[
                                                           //   ImageModel(
                                                           //     price:  PriceString,
                                                           //     imgUrl: value.toString(),
                                                           //   )
                                                           // ];
                                                           //   commonList=imageList;
                                                         });
                                                        Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(builder: (context) =>   CartScreen(price: value, cartImg:cartImgList,)),
                                                        );
                                                      },
                                                      child: const Text("Ok")),
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text("Cancle")),
                                                ],
                                              );
                                            });

                                      },
                                      child: const Text("Ok")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Cancle")),
                                ],
                              );
                            });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height*.6,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 10,
                                color: Colors.deepPurple,
                              )),
                          child: Image.network(widget.commonList[index])),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
