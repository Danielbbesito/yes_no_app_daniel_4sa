//El modelo define que datos debe 
//tener la aplicacion. Investigar MVC
//MVC: Modelo = informacion 
//Modelo: datos, Vista: Pantalla, Controlador:Logica.





import 'package:yes_no_app_daniel_4sa/domain/entities/message.dart';

class YesNoModel {
    final String answer;
    final bool forced;
    final String image;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    Message toMessageEntity () =>  Message(
      //Condicional ternario para darle valor a los mensajes
      text: answer == "yes"
      ? "Sí" 
      : answer == "no"
      ? "No" 
      : "Quizás",
    //Siempre va a ser de ella
      fromWho: FromWho.hers,
      //Sera gif
      imageUrl: image);

  
}