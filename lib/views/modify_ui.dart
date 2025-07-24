// ignore_for_file: must_be_immutable, unused_import, must_call_super, unused_local_variable

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:friend_app/models/myfriend.dart';
import 'package:friend_app/services/call_api.dart';
import 'package:google_fonts/google_fonts.dart';

class ModifyUI extends StatefulWidget {
  // ตัวแปรหรือออกเจ็กต์ที่เก็บข้อมูลที่ส่งมาจากหน้า Home ที่ผู้ใช้ได้เลือกรายการที่จะดูเพื่อแก้ไขหรือลบ
  Myfriend? myfriend;

  ModifyUI({super.key, this.myfriend});

  @override
  State<ModifyUI> createState() => _ModifyUIState();
}

class _ModifyUIState extends State<ModifyUI> {
  TextEditingController fNameCtrl = TextEditingController(text: '');
  TextEditingController fEmailCtrl = TextEditingController(text: '');
  TextEditingController fAgeCtrl = TextEditingController(text: '');

  int relationship = 1;

  @override
  void initState() {
    fNameCtrl.text = widget.myfriend!.fName!;
    fEmailCtrl.text = widget.myfriend!.fEmail!;
    fAgeCtrl.text = widget.myfriend!.fAge!;
    relationship = int.parse(widget.myfriend!.relationship!);

    super.initState();
  }

  // เมธอดแสดงข้อความเตือนจากการ Validate ต่างๆ บนหน้าจอ เช่น เลือกรูป ป้อนชื่อร้าน ป้อนต่าใช้จ่าย เลือกวันที่กิน
  showWarningDialog(context, msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'คำเตือน',
            style: GoogleFonts.itim(),
          ),
        ),
        content: Text(
          msg,
          style: GoogleFonts.itim(),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15.0), // กำหนดรัศมีของมุมโค้ง
                  ),
                ),
                child: Text(
                  'ตกลง',
                  style: GoogleFonts.itim(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Update-Delete Friend',
          style: GoogleFonts.itim(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // กดแล้วย้อนกลับไปหน้าก่อนหน้า
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.075,
              ),
              Image.asset(
                'assets/images/icon.png',
                scale: MediaQuery.sizeOf(context).width * 0.009,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Name',
                    style: GoogleFonts.itim(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.height * 0.01,
                ),
                child: TextField(
                  controller: fNameCtrl,
                  decoration: InputDecoration(
                    hintText: 'EnterName',
                    hintStyle: GoogleFonts.itim(
                      color: Colors.grey[400],
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: GoogleFonts.itim(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.height * 0.01,
                ),
                child: TextField(
                  controller: fEmailCtrl,
                  decoration: InputDecoration(
                    hintText: 'EnterEMail',
                    hintStyle: GoogleFonts.itim(
                      color: Colors.grey[400],
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Age',
                    style: GoogleFonts.itim(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.height * 0.01,
                ),
                child: TextField(
                  controller: fAgeCtrl,
                  decoration: InputDecoration(
                    hintText: 'Enter Age',
                    hintStyle: GoogleFonts.itim(
                      color: Colors.grey[400],
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  top: MediaQuery.of(context).size.height * 0.01,
                  bottom: MediaQuery.of(context).size.height * 0.005,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '',
                    style: GoogleFonts.itim(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    onChanged: (int? value) {
                      setState(() {
                        relationship = value!;
                      });
                    },
                    value: 1,
                    groupValue: relationship,
                    activeColor: Colors.blue,
                  ),
                  Text(
                    'เพื่อนสนิท',
                    style: GoogleFonts.itim(
                      color: Colors.black,
                    ),
                  ),
                  Radio(
                    onChanged: (int? value) {
                      setState(() {
                        relationship = value!;
                      });
                    },
                    value: 2,
                    groupValue: relationship,
                    activeColor: Colors.blue,
                  ),
                  Text(
                    'เพื่อนไม่สนิท',
                    style: GoogleFonts.itim(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate หน้าจอก่อนส่งข้อมูลไปบันทึกเก็บไว้ที่ Server
                  if (fNameCtrl.text.trim().length == 0) {
                    showWarningDialog(context, 'กรุณาป้อนชื่อเพื่อนด้วยครับ');
                  } else if (fEmailCtrl.text.trim().length == 0) {
                    showWarningDialog(context, 'กรุณาป้อนอีเมลเพื่อนด้วยครับ');
                  } else if (fAgeCtrl.text.trim().length == 0) {
                    showWarningDialog(context, 'กรุณาป้อนอายุด้วยครับ');
                  } else {
                    // โค้ดส่วนของการส่งข้อมูลไปบันทึกที่ Server
                    Myfriend myfriend = Myfriend(
                      fName: fNameCtrl.text.trim(),
                      fEmail: fEmailCtrl.text.trim(),
                      fAge: fAgeCtrl.text.trim(),
                      relationship: relationship.toString(),
                    );

                    CallApi.callAPIUpdateFriend(myfriend)
                        .then((value) => showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'ผลการทำงาน',
                                    style: GoogleFonts.itim(),
                                  ),
                                ),
                                content: Text(
                                  'บันทึกการแก้ไขเรียบร้อยแล้ว',
                                  style: GoogleFonts.itim(),
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                15.0), // กำหนดรัศมีของมุมโค้ง
                                          ),
                                        ),
                                        child: Text(
                                          'ตกลง',
                                          style: GoogleFonts.itim(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ))
                        .then((value) => Navigator.pop(context));
                  }
                },
                child: Text(
                  'บันทึกแก้ไขข้อมูลการกิน',
                  style: GoogleFonts.itim(),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  fixedSize: Size(
                    MediaQuery.of(context).size.width * 0.8,
                    MediaQuery.of(context).size.height * 0.07,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15.0), // กำหนดรัศมีของมุมโค้ง
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              ElevatedButton(
                onPressed: () {
                  Myfriend myfriend = Myfriend(
                    fId: widget.myfriend!.fId!,
                    relationship: widget.myfriend!.relationship!,
                  );

                  CallApi.callAPIDeleteFriend(myfriend)
                      .then((value) => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'ผลการทำงาน',
                                  style: GoogleFonts.itim(),
                                ),
                              ),
                              content: Text(
                                'ลบข้อมูลเรียบร้อยแล้ว',
                                style: GoogleFonts.itim(),
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              15.0), // กำหนดรัศมีของมุมโค้ง
                                        ),
                                      ),
                                      child: Text(
                                        'ตกลง',
                                        style: GoogleFonts.itim(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ))
                      .then((value) => Navigator.pop(context));
                },
                child: Text(
                  'ลบข้อมูล',
                  style: GoogleFonts.itim(),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  fixedSize: Size(
                    MediaQuery.of(context).size.width * 0.8,
                    MediaQuery.of(context).size.height * 0.07,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
