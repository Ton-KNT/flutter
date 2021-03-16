
import 'package:dbtestproject3it1/Categories/categories_car.dart';
import 'package:dbtestproject3it1/Categories/categories_truck.dart';
import 'package:dbtestproject3it1/Categories/categories_van.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget{


  @override
  Widget build(BuildContext context){

    return Drawer(
      child: Container(
        color: Colors.blueGrey[700],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.all(0.0),
                margin: EdgeInsets.all(0.0),
                child: Center(
                  child: Column(
                    children: [
                      UserAccountsDrawerHeader(
                        decoration: BoxDecoration(color: Colors.green[900],),
                        accountName: Text('hhh'),
                        accountEmail: Text("guest@gmail.com"),
                        margin: EdgeInsets.all(0.0),
                        currentAccountPicture: CircleAvatar(
                          radius: 60.0,
                          backgroundColor: Colors.grey[400].withOpacity(0.4),
                          child: Icon(FontAwesomeIcons.user,color: Colors.white,),
                        ),
                      ),
                    ],
                  ),
                ),
            ),

            ListTile(
              leading: Icon(
                FontAwesomeIcons.carAlt,
                color: Colors.white,
                size: 25,
              ),
              title: Text('SuperCar',style: TextStyle(color: Colors.white),),
              onTap: (){
                Navigator.of(context).pushReplacementNamed(CategoriesOfCars.routeName);
                },
            ),

            ListTile(
              leading: Icon(
                FontAwesomeIcons.shuttleVan,
                color: Colors.white,
                size: 25,
              ),
              title: Text('SUV',style: TextStyle(color: Colors.white),),
              onTap: (){
                Navigator.of(context).pushReplacementNamed(CategoriesOfVans.routeName);
              },
            ),

            ListTile(
              leading: Icon(
                FontAwesomeIcons.truckPickup,
                color: Colors.white,
                size: 25,
              ),
              title: Text('Pickups',style: TextStyle(color: Colors.white),),
              onTap: (){
                Navigator.of(context).pushReplacementNamed(CategoriesOfTrucks.routeName);
              },
            ),

            Divider(color: Colors.grey[300],indent: 20.0,endIndent: 20.0,),


          ],
        ),
      ),
    );
  }
}