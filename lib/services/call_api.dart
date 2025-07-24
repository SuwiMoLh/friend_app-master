// ไฟล์นี้เป็นไฟล์เรียกใช้ Api ต่างๆ

// ignore_for_file: unused_import

import 'dart:convert';
import 'package:friend_app/models/myfriend.dart';
import 'package:http/http.dart' as http;
import 'package:friend_app/models/mem.dart';
import 'package:friend_app/utils/env.dart';

class CallApi {
  // เมธอดเรียกใช้ API : getall --------------------------------------------
  static Future<List<Myfriend>> callAPIGetAllFriend() async {
    // เรียกใช้ API
    final response = await http.get(
      Uri.parse(Env.domainURL + '/friendapi/getallf'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // เอาข้อมูลที่ส่งกลับมาเป็น JSON แปลงเป็นข้อมูลที่จะนำมาใช้ในแอป เก็ยไว้ในตัวแปร
      final responseData = jsonDecode(response.body);

      // แปลงข้อมูลให้เป็น List และเก็บในตัวแปร List
      final friendDataList = await responseData.map<Myfriend>((json) {
        return Myfriend.fromJson(json);
      }).toList();

      return friendDataList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  // เมธอดเรียกใช้ API : insert --------------------------------------------
  static Future<String> callAPIInsertFriend(Myfriend myfriend) async {
    // เรียกใช้ API
    final response = await http.post(
      Uri.parse(Env.domainURL + '/friendapi/insertf'),
      body: jsonEncode(myfriend.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // เอาข้อมูลที่ส่งกลับมาเป็น JSON แปลงเป็นข้อมูลที่จะนำมาใช้ในแอป เก็ยไว้ในตัวแปร
      final responseData = jsonDecode(response.body);
      // print(responseData['message']);

      // ส่งค่าข้อมูลที่ส่งกลับมาไปที่จุดเรียกใช้เมธอด
      return responseData['message']!;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  // เมธอดเรียกใช้ API : update --------------------------------------------
  static Future<String> callAPIUpdateFriend(Myfriend myfriend) async {
    // เรียกใช้ API
    final response = await http.post(
      Uri.parse(Env.domainURL + '/friendapi/updatef'),
      body: jsonEncode(myfriend.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // เอาข้อมูลที่ส่งกลับมาเป็น JSON แปลงเป็นข้อมูลที่จะนำมาใช้ในแอป เก็ยไว้ในตัวแปร
      final responseData = jsonDecode(response.body);

      // ส่งค่าข้อมูลที่ส่งกลับมาไปที่จุดเรียกใช้เมธอด
      return responseData['message'];
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  // เมธอดเรียกใช้ API : delete --------------------------------------------
  static Future<String> callAPIDeleteFriend(Myfriend myfriend) async {
    // เรียกใช้ API
    final response = await http.post(
      Uri.parse(Env.domainURL + '/friendapi/deletef'),
      body: jsonEncode(myfriend.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // เอาข้อมูลที่ส่งกลับมาเป็น JSON แปลงเป็นข้อมูลที่จะนำมาใช้ในแอป เก็ยไว้ในตัวแปร
      final responseData = jsonDecode(response.body);

      // ส่งค่าข้อมูลที่ส่งกลับมาไปที่จุดเรียกใช้เมธอด
      return responseData['message'];
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  // เมธอดเรียกใช้ API : checklogin --------------------------------------------
  static Future<Mem> callAPIChecklogin(Mem mem) async {
    // เรียกใช้ API
    final response = await http.post(
      Uri.parse(Env.domainURL + '/friendapi/checksigninf'),
      body: jsonEncode(mem.toJson()),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // เอาข้อมูลที่ส่งกลับมาเป็น JSON แปลงเป็นข้อมูลที่จะนำมาใช้ในแอป เก็ยไว้ในตัวแปร
      final responseData = jsonDecode(response.body);

      // ส่งค่าข้อมูลที่ส่งกลับมาไปที่จุดเรียกใช้เมธอด
      return Mem.fromJson(responseData);
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
