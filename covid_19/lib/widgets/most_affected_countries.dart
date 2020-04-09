import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List affectedCountries;

  const MostAffectedPanel({Key key, this.affectedCountries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width*0.1,
                    height: 25,
                    margin: EdgeInsets.all(8),

                    child: Image.network(
                        affectedCountries[index]["countryInfo"]["flag"] ,fit: BoxFit.cover,),
                  ),
                  Text(
                    affectedCountries[index]["country"],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    'Deaths : ' + affectedCountries[index]["deaths"].toString(),
                    style: TextStyle(color: Colors.red ,fontWeight: FontWeight.bold),
                  )
                ],
              ),
            );
          }),
    );
  }
}
