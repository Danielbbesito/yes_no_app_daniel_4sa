import 'package:flutter/material.dart';
import 'package:yes_no_app_daniel_4sa/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: "Hola ader", fromWho: FromWho.me),
     Message(text: "¿LLoras porque reprobaste tópicos?", fromWho: FromWho.me)
  ];

  //Controlador para manejar la velocidad del scroll
  final ScrollController chatScrollController = ScrollController();


  //Enviar un mensaje
  Future<void> sendMessage(String text) async {
    //El mensaje siempre va a ser "me" porque yo lo envío
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //Agrega un elemento a la lista "messageList"
    messageList.add(newMessage);
    //Notifica si algo de provider cambió para que se guarde en el estado
    notifyListeners();
    //MUeve el scroll
    moveScrollToBottom();
  }
    //Mover el scroll al ultimo mensaje

    Future<void> moveScrollToBottom() async {
      //Un pequeño atraso en la animacion para garantizar que siempre
      //se vera aún cuando se envien mensajes cortos y rápidos
      await Future.delayed(const Duration(seconds: 1));
      chatScrollController.animateTo(
        //Offset: posición de la animación
        //maxScrollExtent determina a lo máximo que el scroll puede dar
        chatScrollController.position.maxScrollExtent, 
        //Duraición de la animación
        duration: const Duration(milliseconds: 300), 
        
        curve: Curves.easeOut);
    
  }
}

