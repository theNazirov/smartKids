import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_kid/models/finally.dart';
import 'package:smart_kid/widgets/custom_app_bar.dart';

import '../services/chat/chat_sevice.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/my_text_field.dart';

class EmployeeChatScreen extends StatefulWidget {
  final receiveUserEmail;
  final receiveUserID;

  const EmployeeChatScreen(
      {super.key, required this.receiveUserEmail, required this.receiveUserID});

  @override
  State<EmployeeChatScreen> createState() => _EmployeeChatScreenState();
}

class _EmployeeChatScreenState extends State<EmployeeChatScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _messageController = TextEditingController();
  final ChatServce _chatServce = ChatServce();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    // only send message if there is something to send
    if (_messageController.text.isNotEmpty) {
      await _chatServce.sendMessage(
          widget.receiveUserID, _messageController.text);
      //clear the text controller after sending the message
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCEF8D5),
      key: _scaffoldKey,
      body: SafeArea(
          child: Column(
        children: [
          CustomAppBar(
            titleText: "Ism familyasi",
            onTap: () => Navigator.pop(context),
          ),
          Container(
            color: const Color(0xFF02A858),
            width: MediaQuery.of(context).size.width,
            height: 50.h,
            child: Center(
                child: Text("Muloqot/_ta a'zo", style: textStyleAppbarTitle)),
          ),
          // body chat
          Expanded(child: _buildMessageList()),
          // body send
          _bodySend()
        ],
      )),
    );
  }

  // build message list
  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatServce.getMessage(
          widget.receiveUserID, _firebaseAuth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
            controller: PageController(
                initialPage: snapshot.data!.docs
                    .map((document) => _buildMessageItem(document))
                    .toList()
                    .length),
            children: snapshot.data!.docs
                .map((document) => _buildMessageItem(document))
                .toList());
      },
    );
  }

// build message item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    //align the message th the right if the sender is current user,otherwise to the left
    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          children: [
            Text(
              data['senderEmail'].toString().split("@")[0].replaceFirst(
                  data['senderEmail'].toString().split("@")[0][0],
                  data['senderEmail']
                      .toString()
                      .split("@")[0][0]
                      .toUpperCase()),
              style: textStyleCustomPrimeryButton,
            ),
            const SizedBox(
              height: 8,
            ),
            ChatBubble(message: data['message']),
          ],
        ),
      ),
    );
  }

//buil send  body
  Widget _bodySend() {
    return Container(
      color: const Color(0xFF02A858),
      width: MediaQuery.of(context).size.width,
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 310.w,
            height: 30.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(14.5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: Image.asset('assets/smile_keyboard_icon.png')),
                ),
                //textfild
                Expanded(
                    child: MytextField(
                        controller: _messageController,
                        hintText: "Habar yuborish",
                        obscureText: false)),
                InkWell(
                  onTap: sendMessage,
                  child: SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: Image.asset('assets/send_icon.png')),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: SizedBox(
                width: 24.w,
                height: 24.h,
                child: Image.asset('assets/mic_icon.png')),
          )
        ],
      ),
    );
  }
}
