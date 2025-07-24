import 'package:flutter/material.dart';
import 'package:friend_app/models/myfriend.dart';
import 'package:friend_app/services/call_api.dart';
import 'package:friend_app/views/add_ui.dart';
import 'package:friend_app/views/login_ui.dart';
import 'package:friend_app/views/modify_ui.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/env.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  // สร้างตัวแปรที่เก็บข้อมูลจากการเรียกใช้ API
  Future<List<Myfriend>>? friendData;

  // สร้างเมธอดที่เรียกใช้ API
  getAllFriend() {
    setState(() {
      friendData = CallApi.callAPIGetAllFriend();
    });
  }

  @override
  void initState() {
    getAllFriend();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text(
          'Show All Friend',
          style: GoogleFonts.itim(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginUI(),
                ),
              );
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          ),
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddUI(),
            ),
          );
        },
        child: Container(
          width: 56.0,
          height: 56.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue[400],
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            // แสดงรูปที่เตรียมไว้
            // Image.asset(
            //   'assets/images/icon.png',
            //   fit: BoxFit.cover,
            // ),
            // แสดงข้อมูลรายการกินที่ Get มาจาก Database ที่ Server ในรูปของ ListView
            Expanded(
              child: FutureBuilder(
                future: CallApi.callAPIGetAllFriend(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    // เอาข้อมูลใส่ ListView โดยการตรวจสอบ massage
                    if (snapshot.data[0].message == '0') {
                      return Center(
                        child: Text(
                          'ยังไม่มีข้อมูล',
                          style: GoogleFonts.itim(),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        // นับจำนวนข้อมูลทีจะแสดงใน ListView
                        itemCount: snapshot.data!.length,
                        // Layout ของ ListView ที่จะนำข้อมูลมาแสดง
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  // เอาข้อมูลที่ได้มาจาก Server เก็บไว้ในตัวแปร/ออปเจ็กต์
                                  Myfriend myfriend = Myfriend(
                                    fId: snapshot.data[index].fId,
                                    fName: snapshot.data[index].fName,
                                    fImage: snapshot.data[index].fImage,
                                    fEmail: snapshot.data[index].fEmail,
                                    fAge: snapshot.data[index].fAge,
                                    relationship:
                                        snapshot.data[index].relationship,
                                  );

                                  // เปิดหน้า modify พร้อมกันส่งข้อมูลในตัวแปรไปแสดงด้วย
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ModifyUI(
                                        myfriend: myfriend,
                                      ),
                                    ),
                                  ).then((value) => getAllFriend());
                                },
                                leading: Image.network(
                                  // Env.domainURL + 'diaryfoodapi/images/img1.jpg',
                                  Env.domainURL +
                                      '/friendapi/images/' +
                                      snapshot.data[index].foodImage,
                                  fit: BoxFit.cover,
                                  height: 50,
                                  width: 50,
                                ),
                                title: Text(
                                  snapshot.data[index].foodShopname,
                                ),
                                subtitle: Text(
                                  snapshot.data[index].foodDate,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'มีข้อผิดพลาดเกิดขึ้น',
                        style: GoogleFonts.itim(),
                      ),
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue[400],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
