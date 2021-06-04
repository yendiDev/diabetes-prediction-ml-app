import 'dart:convert';
import 'dart:ffi';
import 'dart:wasm';

import 'package:diabetes_detection_app/helpers/preferences.dart';
import 'package:diabetes_detection_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animations/loading_animations.dart';

//page controller
PageController pageController;

//page slider
int sliderPosition = 0;

class QuestionsPageScreen extends StatefulWidget {
  @override
  _QuestionsPageScreenState createState() => _QuestionsPageScreenState();
}

class _QuestionsPageScreenState extends State<QuestionsPageScreen> {


  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 1, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Container(
          color: Colors.lightBlue,
          height: 100.0,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 20.0),
          child: Container(
            child: Center(child: Text('', style: TextStyle(
              fontSize: 20.0,
              color: Colors.white
            ),)),
          )

        ),
      ),

      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [

          //age page
          AgeQuestionPage(),

          //glucose page
          GlucoseQuestionPage(),

          //diabetes pedigree function
          DiabetesPedifreeQuestionPage(),

          //BMI page
          BMIPage(),

          //skin thickness page
          SkinThicknessQuestionPage(),

          //Insulin page
          InsulinQuestionPage(),

          //blood pressure page
          BloodPressureQuestionPage(),

          //pregnancies page
          PregnancyQuestionPage(),

        ],

      ),

    );
  }
}


class AgeQuestionPage extends StatefulWidget {

  @override
  _AgeQuestionPageState createState() => _AgeQuestionPageState();
}

class _AgeQuestionPageState extends State<AgeQuestionPage> {


  //form global key
  var formKey = GlobalKey<FormState>();

  //patient age
  String age;

  //age controller
  TextEditingController ageController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: ListView(
        children: [

          SizedBox(height: 50.0,),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Material(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              ),
              color: Colors.white,
              child: Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
                child: Column(
                  children: [
                    //patient age
                    Container(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Icon(Icons.person, size: 20.0,),

                          SizedBox(width: 5.0,),

                          Text('Age', style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600

                          ),)

                        ],
                      ),
                    ),

                    SizedBox(height: 10.0,),

                    Container(
                      child: Divider(thickness: 1.5,),
                    ),

                    SizedBox(height: 20.0,),

                    //patient age text
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Text('How old is the patient?', style: TextStyle(
                          fontSize: 18.0
                      ),),
                    ),

                    SizedBox(height: 20.0,),

                    //input field
                    Container(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Center(
                        child: Form(
                          key: formKey,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: ageController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                                hintText: 'Enter value'
                            ),

                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20.0,)
                  ],
                ),
              ),
            ),
          )


        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios, color: Colors.black,),
        backgroundColor: Colors.white,
        onPressed: () {

          //age user input
          age = ageController.text.trim();

          //save age
          Preferences.saveAge(age);

          //set slider position to 0
          if(this.mounted){
            setState(() {
              sliderPosition = 0;
            });
          }
          //use controller from parent widget to move to next screen
          pageController.animateToPage(1, duration: Duration(milliseconds: 200), curve: Curves.bounceIn);


        },

      ),
    );
  }
}



class GlucoseQuestionPage extends StatefulWidget {
  @override
  _GlucoseQuestionPageState createState() => _GlucoseQuestionPageState();
}

class _GlucoseQuestionPageState extends State<GlucoseQuestionPage> {

  //form global key
  var formKey = GlobalKey<FormState>();

  //glucose
  String glucose;

  TextEditingController glucoseController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: ListView(
        children: [

          SizedBox(height: 50.0,),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Material(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              color: Colors.white,
              child: Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
                child: Column(
                  children: [
                    //patient glucose level
                    Container(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Icon(Icons.all_out, size: 20.0,),

                          SizedBox(width: 5.0,),

                          Text('Glucose Level', style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600

                          ),)

                        ],
                      ),
                    ),

                    SizedBox(height: 10.0,),

                    Container(
                      child: Divider(thickness: 1.5,),
                    ),

                    SizedBox(height: 20.0,),

                    //patient age text
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Text('What is the patient\'s glucose level?', style: TextStyle(
                          fontSize: 18.0
                      ),),
                    ),

                    SizedBox(height: 20.0,),

                    //input field
                    Container(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      height: 60.0,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Center(
                        child: Form(
                          key: formKey,
                          child: TextFormField(
                            controller: glucoseController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                              hintText: 'Enter a decimal value'
                            ),

                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20.0,)
                  ],
                ),
              ),
            ),
          )


        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios, color: Colors.black,),
        backgroundColor: Colors.white,
        onPressed: () {

          //get glucose
          glucose = glucoseController.text.trim();

          //save glucose
          Preferences.saveGlucose(glucose);

          //set slider position to 1
          if(this.mounted){
            setState(() {
              sliderPosition = 1;
            });
          }

          //use controller from parent widget to move to next screen
          pageController.animateToPage(2, duration: Duration(milliseconds: 200), curve: Curves.bounceIn);


        },

      ),
    );
  }
}



class DiabetesPedifreeQuestionPage extends StatefulWidget {
  @override
  _DiabetesPedifreeQuestionPageState createState() => _DiabetesPedifreeQuestionPageState();
}

class _DiabetesPedifreeQuestionPageState extends State<DiabetesPedifreeQuestionPage> {


  //form global key
  var formKey = GlobalKey<FormState>();

  //pedigree
  String pedigree;

  TextEditingController pedigreeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: ListView(
        children: [

          SizedBox(height: 50.0,),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Material(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              color: Colors.white,
              child: Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
                child: Column(
                  children: [
                    //patient glucose level
                    Container(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Icon(Icons.all_out, size: 20.0,),

                          SizedBox(width: 5.0,),

                          Text('Diabetes Pedigree Function', style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600

                          ),)

                        ],
                      ),
                    ),

                    SizedBox(height: 10.0,),

                    Container(
                      child: Divider(thickness: 1.5,),
                    ),

                    SizedBox(height: 20.0,),

                    //patient age text
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Text('What is the patient\'s diabetes pedigree function?', style: TextStyle(
                          fontSize: 18.0
                      ),),
                    ),

                    SizedBox(height: 20.0,),

                    //input field
                    Container(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      height: 60.0,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Center(
                        child: Form(
                          key: formKey,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: pedigreeController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                              hintText: 'Enter a decimal value'
                            ),

                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20.0,)
                  ],
                ),
              ),
            ),
          )


        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios, color: Colors.black,),
        backgroundColor: Colors.white,
        onPressed: () {

          //get diabetes pedigree function
          pedigree = pedigreeController.text.trim();

          //save pedigree
          Preferences.savePedigree(pedigree);

          //set slider position to 2
          if(this.mounted){
            setState(() {
              sliderPosition = 2;
            });
          }
          //use controller from parent widget to move to next screen
          pageController.animateToPage(3, duration: Duration(milliseconds: 200), curve: Curves.bounceIn);


        },

      ),
    );
  }
}



class BMIPage extends StatefulWidget {
  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {


  //form global key
  var formKey = GlobalKey<FormState>();

  //BMI
  String bmi;

  TextEditingController bmiController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: ListView(
        children: [

          SizedBox(height: 50.0,),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Material(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              color: Colors.white,
              child: Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
                child: Column(
                  children: [
                    //patient BMI level
                    Container(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Icon(Icons.accessibility, size: 25.0,),

                          SizedBox(width: 5.0,),

                          Text('Body Mass Index', style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600


                          ),)

                        ],
                      ),
                    ),

                    SizedBox(height: 10.0,),

                    Container(
                      child: Divider(thickness: 1.5,),
                    ),

                    SizedBox(height: 20.0,),

                    //patient BMI text
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Text('What is the patient\'s body mass index?', style: TextStyle(
                          fontSize: 18.0
                      ),),
                    ),

                    SizedBox(height: 20.0,),

                    //input field
                    Container(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      height: 60.0,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Center(
                        child: Form(
                          key: formKey,
                          child: TextFormField(
                            controller: bmiController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter a decimal value'
                            ),

                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20.0,)
                  ],
                ),
              ),
            ),
          )


        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios, color: Colors.black,),
        backgroundColor: Colors.white,
        onPressed: () {

          //get bmi
          bmi = bmiController.text.trim();

          //save bmi
          Preferences.saveBMI(bmi);

          //set slider position to 3
          if(this.mounted){
            sliderPosition = 3;
            setState(() {
              sliderPosition = 3;
            });
            print('slider position set to 3');
          }
          //use controller from parent widget to move to next screen
          pageController.animateToPage(4, duration: Duration(milliseconds: 200), curve: Curves.bounceIn);


        },

      ),
    );
  }
}



class SkinThicknessQuestionPage extends StatefulWidget {
  @override
  _SkinThicknessQuestionPageState createState() => _SkinThicknessQuestionPageState();
}

class _SkinThicknessQuestionPageState extends State<SkinThicknessQuestionPage> {


  //form key
  var formKey = GlobalKey<FormState>();

  //thickness
  String thickness;

  TextEditingController thicknessController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: ListView(
        children: [

          SizedBox(height: 50.0,),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Material(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              color: Colors.white,
              child: Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
                child: Column(
                  children: [
                    //patient BMI level
                    Container(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Icon(Icons.accessibility, size: 25.0,),

                          SizedBox(width: 5.0,),

                          Text('Skin Thickness', style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600


                          ),)

                        ],
                      ),
                    ),

                    SizedBox(height: 10.0,),

                    Container(
                      child: Divider(thickness: 1.5,),
                    ),

                    SizedBox(height: 20.0,),

                    //patient BMI text
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Text('What is the patient\'s skin thickness?', style: TextStyle(
                          fontSize: 18.0
                      ),),
                    ),

                    SizedBox(height: 20.0,),

                    //input field
                    Container(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      height: 60.0,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Center(
                        child: Form(
                          key: formKey,
                          child: TextFormField(
                            controller: thicknessController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter a decimal value'
                            ),

                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20.0,)
                  ],
                ),
              ),
            ),
          )


        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios, color: Colors.black,),
        backgroundColor: Colors.white,
        onPressed: () {

          //get thickness
          thickness = thicknessController.text.trim();

          //save thickness
          Preferences.saveSkinThickness(thickness);

          //set slider position to 4
          if(this.mounted){
            setState(() {
              sliderPosition = 4;
            });
          }

          //use controller from parent widget to move to next screen
          pageController.animateToPage(5, duration: Duration(milliseconds: 200), curve: Curves.bounceIn);


        },

      ),
    );
  }
}



class InsulinQuestionPage extends StatefulWidget {
  @override
  _InsulinQuestionPageState createState() => _InsulinQuestionPageState();
}

class _InsulinQuestionPageState extends State<InsulinQuestionPage> {

  //form key
  var formKey = GlobalKey<FormState>();

  //insulin
  String insulin;

  TextEditingController insulinController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: ListView(
        children: [

          SizedBox(height: 50.0,),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Material(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              color: Colors.white,
              child: Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
                child: Column(
                  children: [
                    //patient glucose level
                    Container(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Icon(Icons.all_out, size: 20.0,),

                          SizedBox(width: 5.0,),

                          Text('Insulin level', style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600

                          ),)

                        ],
                      ),
                    ),

                    SizedBox(height: 10.0,),

                    Container(
                      child: Divider(thickness: 1.5,),
                    ),

                    SizedBox(height: 20.0,),

                    //patient age text
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Text('What is the patient\'s Insulin level?', style: TextStyle(
                          fontSize: 18.0
                      ),),
                    ),

                    SizedBox(height: 20.0,),

                    //input field
                    Container(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      height: 60.0,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Center(
                        child: Form(
                          key: formKey,
                          child: TextFormField(
                            controller: insulinController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter a decimal value'
                            ),

                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20.0,)
                  ],
                ),
              ),
            ),
          )


        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios, color: Colors.black,),
        backgroundColor: Colors.white,
        onPressed: () {

          //get insulin
          insulin = insulinController.text.trim();

          //save insulin
          Preferences.saveInsulin(insulin);

          //set slider position to 5
          if(this.mounted){
            setState(() {
              sliderPosition = 5;
            });
          }
          //use controller from parent widget to move to next screen
          pageController.animateToPage(6, duration: Duration(milliseconds: 200), curve: Curves.bounceIn);


        },

      ),
    );
  }
}


class BloodPressureQuestionPage extends StatefulWidget {
  @override
  _BloodPressureQuestionPageState createState() => _BloodPressureQuestionPageState();
}

class _BloodPressureQuestionPageState extends State<BloodPressureQuestionPage> {

  //form key
  var formKey = GlobalKey<FormState>();

  //bp
  String bp;

  TextEditingController bpController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: ListView(
        children: [

          SizedBox(height: 50.0,),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Material(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              color: Colors.white,
              child: Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
                child: Column(
                  children: [
                    //patient glucose level
                    Container(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Icon(Icons.favorite, size: 20.0,),

                          SizedBox(width: 5.0,),

                          Text('Blood Pressure', style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600

                          ),)

                        ],
                      ),
                    ),

                    SizedBox(height: 10.0,),

                    Container(
                      child: Divider(thickness: 1.5,),
                    ),

                    SizedBox(height: 20.0,),

                    //patient age text
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Text('What is the patient\'s blood pressure?', style: TextStyle(
                          fontSize: 18.0
                      ),),
                    ),

                    SizedBox(height: 20.0,),

                    //input field
                    Container(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      height: 60.0,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Center(
                        child: Form(
                          key: formKey,
                          child: TextFormField(
                            controller: bpController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter a decimal value'
                            ),

                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20.0,)
                  ],
                ),
              ),
            ),
          )


        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios, color: Colors.black,),
        backgroundColor: Colors.white,
        onPressed: () {

          //get insulin
          bp = bpController.text.trim();

          //save insulin
          Preferences.saveBloodPressure(bp);

          //set slider position to 6
          if(this.mounted){
            setState(() {
              sliderPosition = 6;
            });
          }
          //use controller from parent widget to move to next screen
          pageController.animateToPage(7, duration: Duration(milliseconds: 200), curve: Curves.bounceIn);


        },

      ),
    );
  }
}




class PregnancyQuestionPage extends StatefulWidget {
  @override
  _PregnancyQuestionPageState createState() => _PregnancyQuestionPageState();
}

class _PregnancyQuestionPageState extends State<PregnancyQuestionPage> {


  //form key
  var formKey = GlobalKey<FormState>();

  //pregnancy
  String pregnancy;

  TextEditingController pregnancyController = new TextEditingController();

  showResultsDialogPositive(BuildContext context){
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: Container(
          height: 340.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Column(
            children: [

              //image container
              Container(
                height: 150.0,
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  child: Image.asset('assets/triangle.png'),
                ),
              ),

              SizedBox(height: 20.0,),

              //results text
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text('The results came back positive. The patient possibly has DIABETES', textAlign: TextAlign.center, style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500
                ),),
              ),

              SizedBox(height: 20.0,),

              //okay button
              Container(
                height: 60.0,
                width: double.infinity,
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                child: MaterialButton(
                  onPressed: (){
                    //pop screen
                    Navigator.of(context).pop();

                    //clear all screens
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                      builder: (_) => HomeScreen()
                    ), (route) => false);

                  },
                  color: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: Text('CLOSE', style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.white
                  ),),
                ),
              )


            ],
          ),

        ),
      )
    );
  }

  showResultsDialogNegative(BuildContext context){
    showDialog(
        context: context,
        builder: (_) => Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Container(
            height: 340.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0)
            ),
            child: Column(
              children: [

                //image container
                Container(
                  height: 150.0,
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    child: Image.asset('assets/shield.png'),
                  ),
                ),

                SizedBox(height: 20.0,),

                //results text
                Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text('The results came back negative. The patient possibly does not have DIABETES', textAlign: TextAlign.center, style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500
                  ),),
                ),

                SizedBox(height: 20.0,),

                //okay button
                Container(
                  height: 60.0,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: MaterialButton(
                    onPressed: (){
                      //pop screen
                      Navigator.of(context).pop();

                      //clear all screens
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                          builder: (_) => HomeScreen()
                      ), (route) => false);

                    },
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: Text('CLOSE', style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.white
                    ),),
                  ),
                )


              ],
            ),

          ),
        )
    );
  }

  showLoadingDialog(BuildContext context){
    showDialog(
        context: context,
        barrierDismissible: false,
        child: Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          child: Container(
            height: 150.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0)
            ),
            child: Column(
              children: [

                SizedBox(height: 10.0,),

                Container(
                  height: 70.0,
                  width: 70.0,
                  child: LoadingBouncingGrid.square(
                    size: 50.0,
                    backgroundColor: Colors.lightBlue,
                  ),
                ),

                SizedBox(width: 10.0,),

                //loading text
                Container(
                  child: Text('Just a sec ...', style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400
                  ),),
                )

              ],
            ),

          ),
        )
    );

  }

  @override
  Widget build(BuildContext context) {
    sliderPosition = 7;

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: ListView(
        children: [

          SizedBox(height: 50.0,),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Material(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              color: Colors.white,
              child: Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
                child: Column(
                  children: [
                    //patient glucose level
                    Container(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Icon(Icons.local_hospital, size: 20.0,),

                          SizedBox(width: 5.0,),

                          Text('Pregnancy', style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600

                          ),)

                        ],
                      ),
                    ),

                    SizedBox(height: 10.0,),

                    Container(
                      child: Divider(thickness: 1.5,),
                    ),

                    SizedBox(height: 20.0,),

                    //patient age text
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Text('How many pregnancies have the patient gotten?', style: TextStyle(
                          fontSize: 18.0
                      ),),
                    ),

                    SizedBox(height: 20.0,),

                    //input field
                    Container(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      height: 60.0,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Center(
                        child: Form(
                          key: formKey,
                          child: TextFormField(
                            controller: pregnancyController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter a decimal value'
                            ),

                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20.0,),

                    //proceed button
                    Container(
                      height: 60.0,
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                        ),
                        onPressed: ()async{
                          //show loading dialog
                          showLoadingDialog(context);

                          //get pregnancy
                          pregnancy = pregnancyController.text.trim();

                          //save pregnancy
                          Preferences.savePregnancy(pregnancy);

                          //retrieve all values into body
                          String age = await Preferences.getAge();
                          String preg = await Preferences.getPregnancy();
                          String glucose = await Preferences.getGlucose();
                          String bp = await Preferences.getBloodPressure();
                          String thickness = await Preferences.getThickness();
                          String insulin = await Preferences.getInsulin();
                          String bmi = await Preferences.getBMI();
                          String pedigree = await Preferences.getPedigree();

                          var body = {
                            'Pregnancies': double.parse(preg),
                            'Glucose': double.parse(glucose),
                            'BloodPressure': double.parse(bp),
                            'SkinThickness': double.parse(thickness),
                            'Insulin': double.parse(insulin),
                            'BMI': double.parse(bmi),
                            'DiabetesPedigreeFunction': double.parse(pedigree),
                            'Age': double.parse(age)
                          };

                          //print('The encoded body is: ${json.encode(body)}');

                          //make http request to heroku server
                          final url = 'https://diabetes-ml-model.herokuapp.com/predict';
                          var response = await http.post(url,
                              body:json.encode(body),
                            headers: <String, String>{
                              'Content-Type': 'application/json; charset=UTF-8',
                            },
                          );

                          if(response.statusCode == 200){
                            //pop loading screen
                            Navigator.of(context).pop();

                            //all good
                            print('The response is: ${response.body}');

                            //decode response
                            var resDecoded = json.decode(response.body);

                            print('The decoded response is : $resDecoded');


                            //extract prediction
                            var prediction = resDecoded['prediction'];
                            print('The prediction response is : ${prediction[0][0]}');

                            if(prediction[0][0] > 0.5){
                              //results is positive, show positive dialog
                              showResultsDialogPositive(context);

                            } else {
                              //show negative dialog
                              showResultsDialogNegative(context);

                            }


                          } else {
                            //show error messagec
                            print('An error occurred');
                            print('The response is: ${response.body}');
                            print('The response code is: ${response.statusCode}');

                            //pop loading screen
                            Navigator.of(context).pop();

                            //show error toast
                          }


                        },
                        color: Colors.lightBlue,
                        child: Text('ANALYZE', style: TextStyle(
                          fontSize: 19.0,
                          color: Colors.white
                        ),),
                      ),
                    ),

                    SizedBox(height: 20.0,)
                  ],
                ),
              ),
            ),
          )


        ],
      ),
    );
  }
}






