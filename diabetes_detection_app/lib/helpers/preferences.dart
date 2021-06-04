
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  //shared preferences constants
  static final String AGE_TOKEN = 'agetoken';
  static final String INSULIN_TOKEN = 'insulin';
  static final String GLUCOSE_TOKEN = 'glucose';
  static final String PREGNANCY_TOKEN = 'pregnancy';
  static final String DIABETES_PEDIGREE_TOKEN = 'pedigreetoken';
  static final String BMI_TOKEN = 'bmitoken';
  static final String SKIN_THICKNESS_TOKEN = 'skintoken';
  static final String BLOOD_PRESSURE_TOKEN = 'bloodpressure';

  static Future<bool> saveAge(String age)async{
    var sp = await SharedPreferences.getInstance();
    sp.setString(AGE_TOKEN, age);
    return true;
  }

  static Future<bool> saveInsulin(String insulin)async{
    var sp = await SharedPreferences.getInstance();
    sp.setString(INSULIN_TOKEN, insulin);
    return true;
  }

  static Future<bool> saveBloodPressure(String bp)async{
    var sp = await SharedPreferences.getInstance();
    sp.setString(BLOOD_PRESSURE_TOKEN, bp);
    return true;
  }

  static Future<bool> saveGlucose(String glucose)async{
    var sp = await SharedPreferences.getInstance();
    sp.setString(GLUCOSE_TOKEN, glucose);
    return true;
  }

  static Future<bool> savePregnancy(String pregnancy)async{
    var sp = await SharedPreferences.getInstance();
    sp.setString(PREGNANCY_TOKEN, pregnancy);
    return true;
  }

  static Future<bool> savePedigree(String pedigree)async{
    var sp = await SharedPreferences.getInstance();
    sp.setString(DIABETES_PEDIGREE_TOKEN, pedigree);
    return true;
  }

  static Future<bool> saveBMI(String bmi)async{
    var sp = await SharedPreferences.getInstance();
    sp.setString(BMI_TOKEN, bmi);
    return true;
  }

  static Future<bool> saveSkinThickness(String thickness)async{
    var sp = await SharedPreferences.getInstance();
    sp.setString(SKIN_THICKNESS_TOKEN, thickness);
    return true;
  }


  //get methods
  static Future<String> getAge()async{
    var sp = await SharedPreferences.getInstance();
    return sp.getString(AGE_TOKEN);
  }

  static Future<String> getInsulin()async{
    var sp = await SharedPreferences.getInstance();
    return sp.getString(INSULIN_TOKEN);
  }

  static Future<String> getBloodPressure()async{
    var sp = await SharedPreferences.getInstance();
    return sp.getString(BLOOD_PRESSURE_TOKEN);
  }

  static Future<String> getGlucose()async{
    var sp = await SharedPreferences.getInstance();
    return sp.getString(GLUCOSE_TOKEN);
  }

  static Future<String> getPregnancy()async{
    var sp = await SharedPreferences.getInstance();
    return sp.getString(PREGNANCY_TOKEN);
  }

  static Future<String> getPedigree()async{
    var sp = await SharedPreferences.getInstance();
    return sp.getString(DIABETES_PEDIGREE_TOKEN);
  }

  static Future<String> getBMI()async{
    var sp = await SharedPreferences.getInstance();
    return sp.getString(BMI_TOKEN);
  }

  static Future<String> getThickness()async{
    var sp = await SharedPreferences.getInstance();
    return sp.getString(SKIN_THICKNESS_TOKEN);
  }

}