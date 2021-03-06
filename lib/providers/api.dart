import 'dart:async';
import 'dart:convert';

import 'package:admin_managerpassenger/blocs/admin/model/user_authenticate.dart';
import 'package:admin_managerpassenger/utils/config.dart';
import 'package:http/http.dart' as http;

final _base = AddressServer.address;
final _tokenEndpoint = "authenticate";
final _tokenURL = _base + _tokenEndpoint;

Future<Token> getToken(UserLogin userLogin) async {
  print(_tokenURL);
  final http.Response response = await http.post(
    _tokenURL,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userLogin.toDatabaseJson()),
  );
  if (response.statusCode == 200) {
    return Token.fromJson(json.decode(response.body));
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}
