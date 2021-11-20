import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:music_flutter_app/models/music_model.dart';

class FetchMusic {
  final client = http.Client();

  Future<List<Songs>> fetchSongs() async {
    final url = Uri.parse('https://music-be.herokuapp.com/getget');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final parsed = jsonDecode(res.body);
      //print('parse' + parsed.toString()); //.cast<Map<String,dynamic>>();
      final data = parsed.map<Songs>((x) => Songs.fromJson(x)).toList();
      //print('data' + data.toString());
      return data;
    }
    return [];
  }
}
