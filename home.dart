import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp4/search_field.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    Widget banner = new Container(
      height: screenSize.height/5,
      child: new ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: <Widget>[

          new Container(
            padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0,0),
            width: screenSize.width,
            height: screenSize.height/2,
            child: new Stack(
              children: <Widget>[
                Image.asset('images/ha2.jpg'),
              ],
            ),
          ),
          new Container(
            padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0),
            width: screenSize.width,
            height: screenSize.height,
            child: new Stack(
              children: <Widget>[
                Image.asset('images/ha2.jpg'),
              ],
            ),
          ),
          new Container(
            padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0),
            width: screenSize.width,
            height: screenSize.height,
            child: new Stack(
              children: <Widget>[
                Image.asset('images/ha2.jpg'),
              ],
            ),
          ),
          new Container(
            padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0),
            width: screenSize.width,
            height: screenSize.height,
            child: new Stack(
              children: <Widget>[
                Image.asset('images/ha2.jpg'),
              ],
            ),
          ),
          new Container(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 0),
            width: screenSize.width,
            height: screenSize.height,
            color: Colors.yellow,
            child: new Center(
              child: Text("Page 5",style: TextStyle(
                color: Colors.white,
              ),),
            ),
          ),
        ],
      ),
    ); // Banner

    Container phunoidung1 (String image,String heading,String subHeading){
      return Container(
        width: 150.0,
        child: Card(
          child: Wrap(
            children: <Widget>[
              Image.asset(
                  'images/ha1.jpg'
              ),
              ListTile(
                title: Text(heading),
                subtitle: Text(subHeading),
              )
            ],
          ),
        ),
      );//Container
    } // phunoidung1


    Widget noidung1 = new Container(
      margin: EdgeInsets.symmetric(
        vertical: 5.0
      ),
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          phunoidung1("image", "Title1", "SubTitle1" ),
          phunoidung1("image", "Title2", "SubTitle2" ),
          phunoidung1("image", "Title3", "SubTitle3" ),
          phunoidung1("image", "Title4", "SubTitle4" ),
          phunoidung1("image", "Title5", "SubTitle5" ),
          phunoidung1("image", "Title6", "SubTitle6" ),
          phunoidung1("image", "Title7", "SubTitle7" ),
          phunoidung1("image", "Title8", "SubTitle8" ),

        ],
      ),
    );//noidung1

    Container phunoidung2 (String image,String heading,String subHeading){
      return Container(
        width: 180.0,
        height: 200,
        child: Card(
          child: Wrap(
            children: <Widget>[
              Image.asset(
                  'images/ha1.jpg'
              ),
              ListTile(
                title: Text(heading,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0,
                ),),
                subtitle: Text(subHeading,style: TextStyle(
                  fontSize: 12.0,
                ),),
              )
            ],
          ),
        ),
      );//Container
    } // phunoidung1

    Widget noidung2 = new Container(
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              phunoidung2("image", "Title1", "SubTitle1" ),
              phunoidung2("image", "Title2", "SubTitle2" ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              phunoidung2("image", "Title1", "SubTitle1" ),
              phunoidung2("image", "Title2", "SubTitle2" ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              phunoidung2("image", "Title1", "SubTitle1" ),
              phunoidung2("image", "Title2", "SubTitle2" ),
            ],
          )
        ],
      ),
    );

    _onPressed() {
      print("You pressed icon");
    }// searchButton

    Widget buidButton(IconData icon ,String buttionTitle){
      final Color tinColor = Colors.red[300];
      return new Column(
        children: <Widget>[
          new Icon(icon, color: tinColor,size: 50),
          new Container(
              margin: const EdgeInsets.only(top:5.0),
              child: new Text(buttionTitle,
                  style: new TextStyle(
                      fontSize: 15.0,
                      color: tinColor,
                      fontWeight: FontWeight.w600))

          ),
        ],
      );
    };// buidButton

    Widget fourButtionSection = new Container(
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              buidButton(Icons.home, "Khám phá"),
              buidButton(Icons.motorcycle, "Giao Hàng"),
              buidButton(Icons.fastfood, "Đặt Chổ"),
            ],
          ),

        ],
      ),
    );// fourBuition
    
    Widget quangcao = new Container(
      padding: const EdgeInsets.all(10.0),
      child: new Image.asset('images/ha2.jpg'),
    );



    return Scaffold(
      appBar: AppBar(
        title: Text("GaFood",style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: _onPressed),
          new IconButton(icon: new Icon(Icons.store), onPressed: _onPressed),
        ],
      ),
      body: ListView(
        children: <Widget>[
          banner,
          SearchField(),
          fourButtionSection,

          Divider(
            color: Colors.blue,
          ),
          Container(
            margin: const EdgeInsets.all(0),
            child: new Text("Bộ sưu tập",style: TextStyle(
              fontSize:18.0,
              fontWeight: FontWeight.bold,
            ),),
          ),

          noidung1,

          Divider(
            color: Colors.blue,
          ),
          Container(
            height: 30.0,
            child: new Text("Gần đây",style: TextStyle(
              fontSize:18.0,
              fontWeight: FontWeight.bold,
            ),),
          ),

          noidung2,
          quangcao,
          noidung2,


        ],

      ),

    );
  }
}
