import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {

static late SharedPreferences sharedPreferences ;

static  init()async{
   sharedPreferences =await SharedPreferences.getInstance();
 }

static Future<bool> setData({required key,required value})async{
  return await sharedPreferences.setBool(key, value);
 }

 static bool? getData({required key}){
   return sharedPreferences.getBool(key);
 }
}