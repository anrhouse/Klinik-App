import 'package:flutter/material.dart';
import 'package:flutter_app/data/service/LoginService.dart';
import 'package:flutter_app/ui/beranda/beranda.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Login',
      )),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Text("Login Admin",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
              Center(
                child: Form(
                    key: _formKey,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(labelText: "Username"),
                            controller: _username,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Isi Username";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: "Password"),
                            obscureText: true,
                            controller: _password,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Masukkan Password";
                              }
                              return null;
                            },
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    String username = _username.text;
                                    String password = _password.text;
                                    await LoginService()
                                        .login(username, password)
                                        .then((value) {
                                      if (value == true) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Beranda()));
                                      } else {
                                        AlertDialog alertDialog = AlertDialog(
                                          content: const Text(
                                              "Username dan Password Salah"),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Ok"),
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.green),
                                            )
                                          ],
                                        );
                                        showDialog(
                                            context: context,
                                            builder: (context) => alertDialog);
                                      }
                                    });
                                  }
                                },
                                child: const Text("Login")),
                          )
                        ],
                      ),
                    )),
              )
            ],
          ),
        )),
      ),
    );
  }
}
