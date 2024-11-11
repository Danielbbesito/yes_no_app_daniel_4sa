import 'package:dio/dio.dart';
import 'package:yes_no_app_daniel_4sa/domain/entities/message.dart';
import 'package:yes_no_app_daniel_4sa/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  //Se crea instancia de la clase dio
  //Para manejar las peticiones de HTTP
  final _dio = Dio();

  //Obtener la respuesta
  Future <Message> getAnswer() async{
    //Almacenar la peticion GET en una variable
    final response = await _dio.get("https://yesno.wtf/api");

    //Almacenar la data de un a respuesta en una variables
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

  //Devolver la instancia de "Message" creada en el modelo
  return yesNoModel.toMessageEntity();

  

  }
}



