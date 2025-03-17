import 'dart:convert';
import 'package:http/http.dart' as http;

class NutritionService {
  final String appId = "YOUR_APP_ID";
  final String appKey = "YOUR_APP_KEY";

  Future<Map<String, dynamic>?> getFoodData(String food) async {
    final url = Uri.parse(
        "https://api.edamam.com/api/food-database/v2/parser?ingr=$food&app_id=$appId&app_key=$appKey");

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data["parsed"].isNotEmpty) {
        return data["parsed"][0]["food"];
      }
    }
    return null;
  }
}
