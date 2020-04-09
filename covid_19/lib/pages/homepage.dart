import 'dart:convert';

import 'package:covid_19/widgets/infopanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:covid_19/data_source.dart';
import 'package:covid_19/widgets/most_affected_countries.dart';
import 'package:covid_19/widgets/worldwide_panel.dart';

import 'country_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //-------------------- World wide panel Api ----------------------------------
  Map worldWideData;
  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/all');
    setState(() {
      worldWideData = json.decode(response.body);
    });
  }


  //-------------------- Affected Countries panel Api --------------------------

  List affectedCountries;

  fetchAffectedCountries() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/countries');
    setState(() {
      affectedCountries = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldWideData();
    fetchAffectedCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('COVID-19 Tracker'),
      ),
      body: SingleChildScrollView(
          child: Column(
           children: <Widget>[
   // ------------------------- Orange Panel -----------------------------------
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.orange[100],
                ),
                margin: EdgeInsets.all(10),
                height: 100,
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: Text(
                  DataSource.quote,
                  style: TextStyle(color: Colors.orange[800], fontSize: 16 ,fontWeight: FontWeight.bold),
                ),
            ),

   //------------------- Title of World Wide ---------------------------------
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  height: 20,
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    'WorldWide',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CountryPage()));
                },
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        color: primaryBlack),
                    height: 30,
                    margin: EdgeInsets.only(right: 20),
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'Regional',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              ),
            ],
          ),

  // -----------------   WorldWide panel 4 Sections ---------------------------
           worldWideData == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : WorldWidePanel(
                  worldWideData: worldWideData,
                ),

   // ---------------- Title of Most affected Countries ------------------------
           Container(
              height: 20,
              margin: EdgeInsets.only(left: 20, bottom: 10, top: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Most Affected Countries',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              )),
   // -------------------------- Affected Countries List ---------------------
             affectedCountries == null
              ? Container()
              : MostAffectedPanel(
                  affectedCountries: affectedCountries,
                ),
 //------------------- Info panels -------------------------------------------
             InfoPanel(),

 //------------------- Info panels -------------------------------------------
            Text('WE ARE TOGETHER IN THE FIGHT',style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),),
             SizedBox(height: 20,)
        ],
      )),
    );
  }
}
