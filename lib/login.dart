import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoggedIn = false;
  Map userObj = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: SizedBox(
                    width: 200,
                    height: 150,
                    child: Image.asset("assets/images/mh.png")),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    hintText: "abcde@gmail.com"),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    hintText: "password"),
              ),
            ),
            Container(
              height: 50,
              width: 285,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => _HomePage()));
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 285,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: _isLoggedIn
                  ? Column(
                      children: [
                        Image.network("src"),
                        const Text(""),
                        TextButton(
                            onPressed: () {
                              FacebookAuth.instance.logOut().then((value) {
                                setState(() {
                                  _isLoggedIn = false;
                                  userObj = {};
                                });
                              });
                            },
                            child: const Text("Logout"))
                      ],
                    )
                  : Center(
                      child: ElevatedButton(
                          onPressed: () async {
                            FacebookAuth.instance.login(permissions: [
                              "public_profile",
                              "email"
                            ]).then((value) {
                              FacebookAuth.instance
                                  .getUserData()
                                  .then((userData) {
                                setState(() {
                                  _isLoggedIn = true;
                                  userObj = userData;
                                });
                              });
                            });
                          },
                          child: const Text(
                            "Login with Facebook",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )),
                    ),
            ),
            const SizedBox(
              height: 130,
            ),
            const Text("Create Account")
          ],
        ),
      ),
    );
  }
}

class _HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Shops"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              MaterialButton(
                child: const Text("Back"),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}
