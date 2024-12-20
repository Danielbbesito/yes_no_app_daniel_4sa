import 'package:flutter/material.dart';
import 'package:yes_no_app_daniel_4sa/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app_daniel_4sa/domain/entities/message.dart';



class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: "Hola ader", fromWho: FromWho.me),
     Message(text: "¿LLoras porque reprobaste tópicos?", fromWho: FromWho.me)
  ];

  //Controlador para manejar la velocidad del scroll
  final ScrollController chatScrollController = ScrollController();

  //Instancia de la clase GetYesNoAnswer
  final getYesNoAnswer = GetYesNoAnswer();

  //Variable  para la ultima hora de mensaje 
  DateTime lastMessageTime = DateTime.now();

  //Enviar un mensaje
  Future<void> sendMessage(String text) async {
      // Verifica que el texto no esté vacío
  if (text.isEmpty) return; // No envía el mensaje si está vacío

  //Avanza unos mimutos en la ultima hora del mensaje
  lastMessageTime = lastMessageTime.add(const Duration(minutes:1));
  
    //El mensaje siempre va a ser "me" porque yo lo envío
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //Agrega un elemento a la lista "messageList"
    messageList.add(newMessage);

    if (text.endsWith("?")){
      herReply();
    }
    // Imprime la cantidad de mensajes en la lista
  print("Cantidad de mensajes en la lista: ${messageList.length}");
    //Notifica si algo de provider cambió para que se guarde en el estado
    notifyListeners();
    //MUeve el scroll
    moveScrollToBottom();
  }
    //Mover el scroll al ultimo mensaje

    Future<void> moveScrollToBottom() async {
      if (chatScrollController.hasClients){
      //Un pequeño atraso en la animacion para garantizar que siempre
      //se vera aún cuando se envien mensajes cortos y rápidos
      await Future.delayed(const Duration(seconds: 1));
      chatScrollController.animateTo(
        //Offset: posición de la animación
        //maxScrollExtent determina a lo máximo que el scroll puede dar
        chatScrollController.position.maxScrollExtent, 
        //Duraición de la animación
        duration: const Duration(milliseconds: 300), 
        //Rebote al final de la animacion 
        curve: Curves.easeOut);
      }
  }
  
  Future<void> herReply() async {
    await Future.delayed(const Duration(seconds: 2));
    //Obetener el mensaje de la peticion 
    final herMessage = await getYesNoAnswer.getAnswer();
    //Añadir el mensaje de mi crush a la lista
    messageList.add(herMessage);
    //Notifica si algo de provider cambio para el estado
    notifyListeners();
    //Mueve eel scroll hasta el ultimo mensaje recibido
    moveScrollToBottom();
    }
}

