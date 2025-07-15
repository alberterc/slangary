import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:slangary/models/urban_dict.dart';

class UrbanDictService {
  static const String baseUrl = 'https://api.urbandictionary.com/v0';

  Future<UrbanDict> defineTerm(String term) async {
    final resp = await http.get(Uri.parse('$baseUrl/define?term=$term'));

    if (resp.statusCode == 200) {
      return UrbanDict.fromJson(jsonDecode(resp.body));
    } else {
      throw Exception('Failed to load API');
    }
  }

  Future<UrbanDict> random() async {
    final resp = await http.get(Uri.parse('$baseUrl/random'));

    if (resp.statusCode == 200) {
      return UrbanDict.fromJson(jsonDecode(resp.body));
    } else {
      throw Exception('Failed to load API');
    }
  }

  Future test() async {
    final resp =
        await http.get(Uri.parse('https://api.urbandictionary.com/v0/random'));

    if (resp.statusCode == 200) {
      return jsonDecode(resp.body);
    }
  }
}
