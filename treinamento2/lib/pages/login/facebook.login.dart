import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;

class LoginFB {
  static final FacebookLogin facebookSignIn = new FacebookLogin();

  static Future<Map> login() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);
    Map retorno;

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture&access_token=${accessToken.token}');

        var profile = json.decode(graphResponse.body);
        print(profile.toString());
        print(profile['picture']['data']['url']);

        retorno = profile;
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        print('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }

    return retorno;
  }

  static Future<Null> logOut() async {
    await facebookSignIn.logOut();
    print('Logged out.');
  }

  static Future<Container> foto() async {
    return Container(
      height: 200.0,
      width: 200.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(null // profileData['picture']['data']['url'],
              ),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final String email;
  final String lastname;
  final String firstname;
  final String id;
  final String url;

  User(this.name, this.email, this.lastname, this.firstname, this.id, this.url);

  User.fromJson(Map json)
      : name = json['name'],
        email = json['email'],
        lastname = json['last_name'],
        firstname = json['first_name'],
        id = json['id'],
        url = json['url'];

  Map<String, dynamic> toJson() => {
        "name": name,
        "first_name": firstname,
        "last_name": lastname,
        "email": email,
        "id": id,
        "url": url,
      };
}

/* 
Future<String> getPerfil()async{

  String name;
  String email;
  String lastname;
  String firstname;
  String id;
  String url;

  final FacebookLogin facebookSignIn = new FacebookLogin();
  final FacebookLoginResult result = await facebookSignIn.logIn(['email']);
  final FacebookAccessToken accessToken = result.accessToken;

  final graphResponse = await http.get(
      'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture&access_token=${accessToken.token}');

  Map perfil = json.decode(graphResponse.body);

    this.fromJson(perfil)
      : name = json['name'],
        email = json['email'],
        lastname = json['last_name'],
        firstname = json['first_name'],
        id = json['id'],
        url = json['url'];

}

//Exemplo
Future<Map<String, dynamic>> getNome() async {
  final FacebookLogin facebookSignIn = new FacebookLogin();
  final FacebookLoginResult result = await facebookSignIn.logIn(['email']);
  final FacebookAccessToken accessToken = result.accessToken;

  final graphResponse = await http.get(
      'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture&access_token=${accessToken.token}');

  return json.decode(graphResponse.body);
}

  Exemplo
Future<User> getToken() async {
  final FacebookLogin facebookSignIn = new FacebookLogin();
  final FacebookLoginResult result = await facebookSignIn.logIn(['email']);
  final FacebookAccessToken accessToken = result.accessToken;

  final graphResponse = await http.get(
      'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture&access_token=${accessToken.token}');

  return new User.fromJson(json.decode(graphResponse.body));
}

class Token {
  final String access;
  final String type;
  final num expiresIn;

  Token(this.access, this.type, this.expiresIn);

  Token.fromMap(Map<String, dynamic> json)
      : access = json['access_token'],
        type = json['token_type'],
        expiresIn = json['expires_in'];
}

class Id {
  final String id;

  Id(this.id);
}

class Cover {
  final String id;
  final int offsetY;
  final String source;

  Cover(this.id, this.offsetY, this.source);

  Cover.fromMap(Map<String, dynamic> json)
      : id = json['id'],
        offsetY = json['offset_y'],
        source = json['source'];
}

class PublicProfile extends Id {
  final Cover cover;
  final String name;

  PublicProfile.fromMap(Map<String, dynamic> json)
      : cover =
            json.containsKey('cover') ? new Cover.fromMap(json['cover']) : null,
        name = json['name'],
        super(json['id']);
}

class FacebookGraph {
  final String _baseGraphUrl = "https://graph.facebook.com/v2.8/";
  final Token token;

  FacebookGraph(this.token);

  Future<PublicProfile> me(List<String> fields) async {
    String _fields = fields.join(",");
    final http.Response response = await http
        .get("$_baseGraphUrl/me?fields=$_fields&access_token=${token.access}");
    return new PublicProfile.fromMap(json.decode(response.body));
  }
}*/
