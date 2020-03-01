import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class cat extends StatefulWidget {
  @override
  _catState createState() => _catState();
}

class _catState extends State<cat> {

  List<String> imageList = new List();
  ScrollController _scroll = new ScrollController();

  _fetchData()async{
    final respon = await http.get("https://api.thecatapi.com/v1/images/search");
    if(respon.statusCode==200){
      print(jsonDecode(respon.body)[0]['url']);
      setState(() {
        imageList.add(jsonDecode(respon.body)[0]['url']);
      });

    }else{
      print("Object Gagal");
    }
  }
  _fatchDataEnam(){
    for(var i = 0; i < 6; i++){
      _fetchData();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fatchDataEnam();

    _scroll.addListener((){
      if(_scroll.position.pixels == _scroll.position.maxScrollExtent){
        _fatchDataEnam();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scroll.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: _scroll,
        itemCount: imageList.length,
        itemBuilder: (context,i){
          return (MediaQuery.of(context).orientation == Orientation.portrait)?Container(
              height: MediaQuery.of(context).size.height /3,
              width: MediaQuery.of(context).size.width /1,
              child: Image.network(imageList[i],fit: BoxFit.cover,)
          ): Container(
              height: MediaQuery.of(context).size.height /1,
              width: MediaQuery.of(context).size.width /1,
              child: Image.network(imageList[i],fit: BoxFit.cover,)
          );
        },
      ),
    );
  }
}
