import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:twiter_clone/models/Gif.dart';

import 'package:http/http.dart' as http;

//  Variables globales
// final myControllerUser = TextEditingController();
// final myControllerPassw = TextEditingController();

// Aplicacion principal
void main() {
  runApp(login());
}

// Funcion que se corre en main y crea la app de material
class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "login",
        home: loginPrincipal());
  }
}

class loginPrincipal extends StatefulWidget {
  const loginPrincipal({super.key});

  @override
  State<loginPrincipal> createState() => _loginPrincipalState();
}

class _loginPrincipalState extends State<loginPrincipal> {
//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login miPescao"),
      ),
      body: Container(
        child: Text('holaMundo'),
        // child: const containerLogin(),
      ),
    );
  }
}

class HTTPExecute{
  String endPointUrl;
  HTTPExecute(this.endPointUrl);

  loadGet() async{
    var response = await http.get(this.endPointUrl, headers: {clave:valor});

    return(response.satusCode >= 200 && response.statusCode < 300)?response.body.toString():Validate.errorWidget(Constant.SERVER_ERROR, content: "response.statusCode")

    // response.body
    // response.statusCode
  }

  loadPost(Map parameters) async{
    var response = await http.post(this.endPointUrl, body: parameters);
    
  }

  loadDelete() async{
    var response = await http.delete(this.endPointUrl);
  }
  
  loadDelete(Map parameters) async{
    var response = await http.put(this.endPointUrl); 
  }

}

// class containerLogin extends StatefulWidget {
//   const containerLogin({super.key});

//   @override
//   State<containerLogin> createState() => _containerLoginState();
// }

// class _containerLoginState extends State<containerLogin> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//             child: Center(
//           child: Text("Login",
//               style: TextStyle(
//                   color: Color(0xff005fae),
//                   fontSize: 40.0,
//                   fontFamily: 'Nunito')),
//         )),

//         // Usuario
//         Container(
//             padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 7),
//             child: TextField(
//               controller: myControllerUser,
//               decoration: InputDecoration(
//                 hintText: "Usuario",
//                 fillColor: Colors.white,
//                 filled: true,
//               ),
//             )),

//         // Contreaseña
//         Container(
//             padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 7),
//             child: TextField(
//               controller: myControllerPassw,
//               decoration: InputDecoration(
//                 hintText: "Contraseña",
//                 fillColor: Colors.white,
//                 filled: true,
//               ),
//             )),

//         SizedBox(
//           height: 15.0,
//         ),

//         // Boton de enviar
//         ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Color(0xff005fae),
//             ),
//             child: Text(
//               "Enviar",
//               style: TextStyle(fontFamily: 'Nunito', fontSize: 15.0),
//             ),
//             onPressed: () async {})
//       ],
//     ));
//   }
// }
