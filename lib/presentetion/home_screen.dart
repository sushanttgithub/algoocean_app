import 'dart:convert';

import 'package:algoocean_app/model/img_model.dart';
import 'package:algoocean_app/presentetion/history_screen.dart';
import 'package:algoocean_app/services/api_helper.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imgList = [];

  ImageModel imageModel = ImageModel();

  getImages() async {
    ApiHelper().getImg().then((value) => {
          setState(() {
            imageModel = value!;
          })
        });
  }

  void saveListToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('myListKey', imgList);
  }

  void loadListFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      imgList = prefs.getStringList('myListKey') ?? [];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Screen",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Container(
              height: MediaQuery.of(context).size.height * .6,
              width: MediaQuery.of(context).size.height * .7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 10,
                    color: Colors.deepPurple,
                  )),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: imageModel.message != null
                      ? Image.network(imageModel.message.toString())
                      : const Center(child: CircularProgressIndicator())),
            ),
          ),
          GestureDetector(
            onTap: () {
              getImages();
              if (imageModel.message != null) {
                setState(() {
                  imgList.add(imageModel.message.toString());
                  saveListToSharedPreferences();
                });
                print("list...$imgList");
              }
            },
            child: Container(
              height: MediaQuery.of(context).size.height * .07,
              width: MediaQuery.of(context).size.height * .4,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(20)),
              child: const Center(
                child: Text(
                  "New Image",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              loadListFromSharedPreferences();

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HistoryScreen(
                          commonList: imgList,
                        )),
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height * .07,
              width: MediaQuery.of(context).size.height * .4,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(20)),
              child: const Center(
                child: Text(
                  "History of Image",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
