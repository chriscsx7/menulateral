import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUri = 'https://data.mongodb-api.com/app/data-xiwqh/endpoint';

  Future<bool> getUser(String usuario, String password) async {
    var response = await http.get(Uri.parse('$baseUri/usuario?usuario=$usuario&password=$password'));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body) as bool;
      return jsonResponse;
    }
    return false;
  }

  Future<List<String>?> getUserData(String usuario) async {
    var response = await http.get(Uri.parse('$baseUri/usuarioData?usuario=$usuario'));
    List<String> data = [];
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      final nombre = jsonResponse['name'];
      final correo = jsonResponse['correo'];
      final avatar = jsonResponse['avatar'];
      data.add(nombre);
      data.add(correo);
      data.add(avatar);
      return data;
    }
    return null;
  }
}