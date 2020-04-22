import 'dart:convert';

import 'package:covid_19/widgets/infopanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:covid_19/data_source.dart';
import 'package:covid_19/widgets/worldwide_panel.dart';

import 'country_page.dart';
import 'package:intl/intl.dart';


//TODO : refactor home page

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  var f = NumberFormat('###,###,###');

  //-------------------- World wide panel Api ----------------------------------
  Map worldWideData;

  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldWideData = json.decode(response.body);
    });
  }

  //-------------------- Affected Countries panel Api --------------------------

  List affectedCountries;

  fetchAffectedCountries() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
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
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            //------------------------- Main Container -------------------------------

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color(0xffF5F5F5),
            ),

            //----------------- Main Image Container ----------------------------------

            Container(
              height: 230,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/covid0.jpg'),
                      fit: BoxFit.cover)),

            ),

            // ----------------- WorldWide 4 Blocks ----------------------------------

            Positioned(
                left: 60,
                top: 200,
                child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width * 0.70,
                  height: 250,
                  child: worldWideData == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  height: 110,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            blurRadius: 7.0,
                                            spreadRadius: 6.0)
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Confirmed',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        f
                                            .format(worldWideData['cases'])
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 110,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            blurRadius: 7.0,
                                            spreadRadius: 6.0)
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Active',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        f
                                            .format(worldWideData['active'])
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.blue[900],
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  height: 110,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            blurRadius: 7.0,
                                            spreadRadius: 6.0)
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Recovered',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        f
                                            .format(worldWideData['recovered'])
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.green[700],
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 110,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            blurRadius: 7.0,
                                            spreadRadius: 6.0)
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Deathes',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        f
                                            .format(worldWideData['deaths'])
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                )),

            // ---------------- Title of Most affected Countries ------------------------

            Container(
                height: 20,
                margin: EdgeInsets.only(left: 20, bottom: 10, top: 470),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Most Affected Countries',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff021742)),
                )),

            // ------------------- Most Affected Countries ---------------------------
                  //TODO : Convert to Horizontal List
            affectedCountries == null
                ? Container()
                : Container(
                    margin: EdgeInsets.only(
                        left: 10, bottom: 10, top: 510, right: 15),
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color(0xff2AD1FE),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 7.0,
                                    spreadRadius: 6.0)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(affectedCountries[0]
                                          ["countryInfo"]["flag"]),
                                    ),
                                    shape: BoxShape.circle),
                              ),
                              Text(
                                affectedCountries[0]["country"],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Deathes:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.red[500],
                                ),
                              ),
                              Text(
                                f
                                    .format(affectedCountries[0]["deaths"])
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.red[500],
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color(0xff2AD1FE),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 7.0,
                                    spreadRadius: 6.0)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(affectedCountries[1]
                                          ["countryInfo"]["flag"]),
                                    ),
                                    shape: BoxShape.circle),
                              ),
                              Text(
                                affectedCountries[1]["country"],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Deathes:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.red[500],
                                ),
                              ),
                              Text(
                                f
                                    .format(affectedCountries[0]["deaths"])
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.red[500],
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color(0xff2AD1FE),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 7.0,
                                    spreadRadius: 6.0)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(affectedCountries[2]
                                          ["countryInfo"]["flag"]),
                                    ),
                                    shape: BoxShape.circle),
                              ),
                              Text(
                                affectedCountries[2]["country"],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Deathes:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.red[500],
                                ),
                              ),
                              Text(
                                f
                                    .format(affectedCountries[0]["deaths"])
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.red[500],
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

            // --------------------------- See more ----------------------------------

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CountryPage()) );
              },
              child: Container(
                margin: EdgeInsets.only(
                  top: 645,right: 10
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text('See more ..' , style: TextStyle(
                      fontSize: 18,fontWeight: FontWeight.bold,
                        color: Color(0xff021742)
                    ),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
