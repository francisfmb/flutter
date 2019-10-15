/* Pega Localização
import 'package:location/location.dart';

var currentLocation = new LocationData();

var location = new Location();

try {
  currentLocation = await location.getLocation();

  print(
    "Latitude: " +
      currentLocation.latitude.toString(),
  );
  print(
  "Longitude: " +
    currentLocation.longitude.toString(),
  );
} on Exception catch (e) {
  print(e);
  currentLocation = null;
} 
*/
// ################################################################################# //
/* Criação e login FIREBASE

import 'package:firebase_auth/firebase_auth.dart';

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<FirebaseUser> _handleCreateUser(String email, String pass) async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: pass,
    ))
        .user;
    return user;
  }

  Future<FirebaseUser> _handleLogin() async {
    final AuthResult auth = await _auth.signInWithEmailAndPassword(
      email: 'ffumagalli23@gmail.com',
      password: '123456',
    );

    return auth.user;
  }

*/
