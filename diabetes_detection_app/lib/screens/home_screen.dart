import 'package:diabetes_detection_app/helpers/set_status_bar.dart';
import 'package:diabetes_detection_app/screens/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    super.initState();
    SetStatusBar.setStatusColor();
    SharedPreferences.getInstance().then((value){
      var sp = value;
      sp.clear();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,


      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.lightBlue
        ),
        child: Stack(
          children: [
            ListView(
                children: [

                  SizedBox(height: 100.0,),

                  //image container
                  Container(
                    height: 180.0,
                    child: Center(
                      child: Image.asset('assets/phone.png'),
                    ),
                  ),

                  SizedBox(height: 20.0,),


                  Container(
                    child: Text(
                      'TestDoc',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 35.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Text(
                      'Helping you make accurate Diabetes diagnostics!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),

                  SizedBox(height: 30.0,),

                  Container(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Text(
                      'By Clinton Anani',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),

                ]
            ),

            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 60.0,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                margin: EdgeInsets.only(bottom: 20.0),
                child: MaterialButton(
                  onPressed: (){
                    //open start screen
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => QuestionsPageScreen()
                    ));

                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0)
                  ),
                  color: Colors.white,
                  child: Text('Get Started', style: TextStyle(
                    fontSize: 20.0,

                  ),),
                ),
              ),
            )
          ],
        )
      )
    );
  }
}
