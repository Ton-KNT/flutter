
import 'package:dbtestproject3it1/Screen/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesOfCars extends StatefulWidget {
  static const routeName = "car";

  @override
  _CategoriesOfCarState createState() => _CategoriesOfCarState();
}

class _CategoriesOfCarState extends State<CategoriesOfCars> {
  final list_item = [
    {
      "name" : "BMW I8",
      "pic" : "assets/bmw i8.jpg",
      "Price" : 500,
    },
    {
      "name" : "Bugatti Chiron",
      "pic" : "assets/bugati chiron.jpg",
      "Price" : 600,
    },
    {
      "name" : "Nissan GTR R35",
      "pic" : "assets/r35.jpg",
      "Price" : 400,
    },
    {
      "name" : "Maclaren",
      "pic" : "assets/maclaren.jpg",
      "Price" : 800,
    },
    {
      "name" : "Ferrari F8",
      "pic" : "assets/ferrari f8.jpg",
      "Price" : 500,
    },
    {
      "name" : "Tesla Model S",
      "pic" : "assets/tesla model s.jpg",
      "Price" : 600,
    },
    {
      "name" : "Ford Mustang",
      "pic" : "assets/ford mustang.jpg",
      "Price" : 400,
    },
    {
      "name" : "Chevrolet Camero ZL1",
      "pic" : "assets/chevrolet camero zl1.jpg",
      "Price" : 800,
    },
    {
      "name" : "Chevrolet Corvette C8",
      "pic" : "assets/chevrolet corvette c8.jpg",
      "Price" : 800,
    },
    {
      "name" : "lamborghini aventador",
      "pic" : "assets/lamborghini aventador.jpg",
      "Price" : 800,
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: Text('Supercar',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 25),),
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
        // ignore: missing_return
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
              return CategoriesOfCar(
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

class CategoriesOfCar extends StatelessWidget {
  final product_name;
  final product_pic;
  final product_Price;

  CategoriesOfCar(
      {this.product_name,
        this.product_pic,
        this.product_Price,
      });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Hero(
        tag: product_name,
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
          ),
      ),
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
              Navigator.of(context).pushReplacementNamed(CategoriesOfCars.routeName);
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

