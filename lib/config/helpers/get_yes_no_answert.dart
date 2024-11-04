import 'package:dio/dio.dart';
import 'package:yes_no_app_daniel_4sa/domain/entities/message.dart';

class GetYesNoAnswert {
  //Se crea instancia de la clase dio
  //Para manejar las peticiones de HTTP
  final _dio = Dio();

  //Obtener la respuesta
  Future <Message> getAnswer() async{
    //Almacenar la peticion GET en una variable
    final response = await _dio.get("https://yesno.wtf/api");

    //Generar el error
    throw UnimplementedError();

  }
}



