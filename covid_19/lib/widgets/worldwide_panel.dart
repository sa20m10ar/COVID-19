import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {

  final Map worldWideData;

  const WorldWidePanel({Key key, this.worldWideData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          StatusPanel(
            Colors.red[100],
            Colors.red,
            'Confirmed',
             worldWideData['cases'].toString()
          ),
          StatusPanel(
              Colors.blue[100],
              Colors.blue[900],
              'Active',
              worldWideData['active'].toString()
          ),
          StatusPanel(
              Colors.green[100],
              Colors.green,
              'Recovered',
              worldWideData['recovered'].toString()
          ),
          StatusPanel(
              Colors.grey[400],
              Colors.grey[900],
              'Deaths',
              worldWideData['deaths'].toString()
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {

  final Color panelColor ;
  final Color textColor;
  final String title;
  final String count;

  StatusPanel(this.panelColor, this.textColor, this.title, this.count);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: panelColor,

      ),
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(10),
      height: 80,
      width: MediaQuery.of(context).size.width * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title,style: TextStyle(fontWeight: FontWeight.bold,
          color: textColor),),
          Text(count,style: TextStyle(
            color: textColor
          ),),
        ],
      ),
    );
  }
}
