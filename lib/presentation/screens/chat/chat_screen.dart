import 'package:flutter/material.dart';
import 'package:yes_no_app_daniel_4sa/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_daniel_4sa/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_daniel_4sa/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://media.vogue.mx/photos/5f4fff4294d967b5b6cd1a56/2:3/w_1920,c_limit/ester-exposito-en-el-festival-de-cine-de-venecia-2020.jpg"),
          ),
        ),
        title: const Text("Mi amor 😍"),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column( 
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  
                return ( index % 2 == 0)
                  ? const HerMessageBubble()
                  : const MyMessageBubble();

              })
            ),
            //Caja de texto
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
} 