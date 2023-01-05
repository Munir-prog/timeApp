import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class Note {

  String id;
  String title;
  String text;

  Note({
        required this.id,
        required this.title,
        required this.text,
      });

  Future<void> getTime() async {

    try{
      // make the request
      String uri = 'http://worldtimeapi.org/api/timezone/$text';
      Response response = await get(Uri.parse(uri));
      Map data = jsonDecode(response.body);

      // get properties from json
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
    }
    catch (e) {
      print(e);
    }

  }

}