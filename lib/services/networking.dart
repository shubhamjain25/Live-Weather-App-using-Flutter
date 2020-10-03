import 'package:http/http.dart' as http;  //http is added to ease identification of http package uses
import 'dart:convert';

class ActualData{
  ActualData({this.url});
  final String url;

  Future getAPIData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    }
    else {
      print(response.statusCode);
    }
  }
}