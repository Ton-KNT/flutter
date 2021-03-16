
import 'package:dbtestproject3it1/Screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoriesOfVans extends StatefulWidget {
  static const routeName = "van";

  @override
  _CategoriesOfCarState createState() => _CategoriesOfCarState();
}

class _CategoriesOfCarState extends State<CategoriesOfVans> {
  final list_item = [
    {
      "name" : "Mazda CX-9",
      "pic" : "assets/cx9.jpg",
      "Price" : 500,
    },
    {
      "name" : "Isuzu mu-X",
      "pic" : "assets/mux.jpg",
      "Price" : 600,
    },
    {
      "name" : "Nissan Terra",
      "pic" : "assets/nissan terra.jpg",
      "Price" : 400,
    },
    {
      "name" : "Toyota Fortuner",
      "pic" : "assets/fortuner.jpg",
      "Price" : 800,
    },
    {
      "name" : "Mitsubishi Pajero",
      "pic" : "assets/pajero.jpg",
      "Price" : 500,
    },
    {
      "name" : "Range Rover",
      "pic" : "assets/range rover.jpg",
      "Price" : 600,
    },
    {
      "name" : "Subaru Forester",
      "pic" : "assets/subaru forester.jpg",
      "Price" : 400,
    },
    {
      "name" : "Lamborghini Urus",
      "pic" : "assets/lamborghini urus.jpg",
      "Price" : 800,
    },
    {
      "name" : "Honda CR-V",
      "pic" : "assets/honda crv.jpg",
      "Price" : 400,
    },
    {
      "name" : "Ford Everest",
      "pic" : "assets/ford everest.jpg",
      "Price" : 800,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: Text('SUV',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 25),),
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
                return CategoriesOfVan(
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

class CategoriesOfVan extends StatelessWidget {
  final product_name;
  final product_pic;
  final product_Price;

  CategoriesOfVan(
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
              Navigator.of(context).pushReplacementNamed(CategoriesOfVans.routeName);
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

