
import 'package:dbtestproject3it1/Screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoriesOfTrucks extends StatefulWidget {
  static const routeName = "truck";

  @override
  _CategoriesOfCarState createState() => _CategoriesOfCarState();
}

class _CategoriesOfCarState extends State<CategoriesOfTrucks> {
  final list_item = [
    {
      "name" : "Ford Raptor",
      "pic" : "assets/raptor.jpg",
      "Price" : 500,
    },
    {
      "name" : "Toyota REVO",
      "pic" : "assets/revo.jpg",
      "Price" : 600,
    },
    {
      "name" : "Nissan NAVARA 2021",
      "pic" : "assets/nnavara 2021.jpg",
      "Price" : 400,
    },
    {
      "name" : "Mitsubishi Tirton",
      "pic" : "assets/mitsubishi triton.jpg",
      "Price" : 800,
    },
    {
      "name" : "Isuzu D-MAX",
      "pic" : "assets/d max.jpg",
      "Price" : 400,
    },
    {
      "name" : "Chevrolet Colorado",
      "pic" : "assets/colorado.jpg",
      "Price" : 800,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: Text('Pickups',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 25),),
        centerTitle: true,
        elevation: 3.0,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushReplacementNamed(Home.routeName);
          },
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
        ),
      ),


      body: WillPopScope(
        onWillPop: () { Navigator.of(context).pushReplacementNamed(Home.routeName); },
        child: Container(
          color: Colors.grey[500],
          child: GridView.builder(
            padding: const EdgeInsets.all(5.0),
              itemCount: list_item.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 5.0,
              ),
              // ignore: missing_return
              itemBuilder: (BuildContext context, int index){
                return CategoriesOfTruck(
                  product_name: list_item[index]["name"],
                  product_pic: list_item[index]["pic"],
                  product_Price: list_item[index]["Price"],
                );
              }),
        ),
      ),
    );
  }
}

class CategoriesOfTruck extends StatelessWidget {
  final product_name;
  final product_pic;
  final product_Price;

  CategoriesOfTruck(
      {this.product_name,
        this.product_pic,
        this.product_Price,
      });


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(tag: product_name,
        child: Material(
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => _Detail(context)));
            },
            child: GridTile(
              footer: Container(
                color: Colors.grey[700].withOpacity(0.8),
                child: ListTile(
                  title: Text(product_name,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  subtitle: Text('\$$product_Price', style: TextStyle(fontWeight: FontWeight.bold,           // decoration: TextDecoration.lineThrough แม่นเสฟ้นขีดข้า
                      decoration: TextDecoration.lineThrough, color: Colors.green),),
                  // สามาดใช้ subTitle ได้ถ้ามี
                ),
              ),
              child: Image.asset(product_pic,fit: BoxFit.cover,),
            ),
          ),
        ),),
    );
  }

  _Detail(context){
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[500],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[700],
          title: Text(product_name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 25),),
          centerTitle: true,
          elevation: 3.0,
          leading: IconButton(
            onPressed: (){
              Navigator.of(context).pushReplacementNamed(CategoriesOfTrucks.routeName);
            },
            icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
          ),
        ),
        body: Hero(
          tag: product_name,
          child: Column(
            children:[

              Container(
                child: Image.asset(product_pic,fit: BoxFit.cover,),
              ),


            ],
          ),
        ),
      ),
    );
  }

}

