import 'dart:convert';

import 'package:food_order/utils/api_endpoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class RestaurnatController extends GetxController{

  var restaurantList = [].obs;
  

  Future<dynamic> getRestaurnats({String? pinCode})async{
    try{

      var url = Uri.parse('${ApiEndpoints.baseUrl}$pinCode');
      print(url);

       http.Response response = await http.get(url);

       if (response.statusCode == 200) {
        final List<dynamic> restaurants = json.decode(response.body);
        restaurantList.assignAll(restaurants);
      } else {
        throw Exception('Failed to load restaurants');
      }
    }catch(err){
      throw Error();
    }
  }

}