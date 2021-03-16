
import 'package:dbtestproject3it1/Screen/AppDrawer.dart';
import 'package:dbtestproject3it1/Screen/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget{
  static const routeName = 'home';

  final list_item = [
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
    {
      "name" : "BMW I8",
      "pic" : "assets/bmw i8.jpg",
      "Price" : 500,
    },
    {
      "name" : "Bugati Chiron",
      "pic" : "assets/bugati chiron.jpg",
      "Price" : 600,
    },
    {
      "name" : "Nissan GTR R35",
      "pic" : "assets/r35.jpg",
      "Price" : 400,
    },
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
      "name" : "Isuzu D-MAX",
      "pic" : "assets/d max.jpg",
      "Price" : 400,
    },
  ];

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    Future<bool> exit(){
      return showDialog(context: context, builder: (context) => AlertDialog(

        buttonPadding: const EdgeInsets.only(left: 20,right: 20),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: Colors.blueGrey[700],
        title: Text('Are you sure'),
        titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 20),
        content: Text('Do you want to exit'),
        contentTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 15),
        elevation: 2.0,
        actions: [
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
              color: Colors.green,

              child: Text('Yes',style: TextStyle(color: Colors.white,fontSize: 15),),
              onPressed: (){SystemNavigator.pop();}

              ),

          //SizedBox(width: size.width * 0.3,),

          MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.green,

              child: Text('No',style: TextStyle(color: Colors.white,fontSize: 15),),
              onPressed: (){Navigator.of(context).pop();}
              ),
        ],
      ));
    }

    //Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () { exit(); },
      child: Stack(
        children: [

          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text('Home',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 25),),
              centerTitle: true,
              backgroundColor: Colors.blueGrey[700],
              elevation: 3.0,

              actions: [

                MaterialButton(
                  onPressed: ()
                  {
                    Navigator.of(context).pushReplacementNamed(SignupScreen.routeName);
                  },
                  child: Row(
                    children: [
                      Icon(FontAwesomeIcons.signOutAlt,color: Colors.red[700],size: 30,),
                    ],
                  ),
                  textColor: Colors.white,
                ),
              ],
            ),
            body: Container(
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
                    return CategoriesOfSuggestCar(
                      product_name: list_item[index]["name"],
                      product_pic: list_item[index]["pic"],
                      product_Price: list_item[index]["Price"],
                    );
                  }),
            ),

              drawer: AppDrawer(),
            ),
        ],
      ),
    );

  }
}

class CategoriesOfSuggestCar extends StatelessWidget {
  final product_name;
  final product_pic;
  final product_Price;

  CategoriesOfSuggestCar(
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
              Navigator.of(context).pushReplacementNamed(Home.routeName);
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