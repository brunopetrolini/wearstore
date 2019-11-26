import 'package:flutter/material.dart';
import 'package:lojavirtual/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova Conta"),
        centerTitle: true,
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if (model.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );
          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: <Widget>[
                TextFormField(
                  autocorrect: false,
                  controller: _nameController,
                  decoration: InputDecoration(hintText: "Nome Completo"),
                  validator: (text) {
                    if (text.isEmpty)
                      return "Nome inválido";
                    else
                      return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  autocorrect: false,
                  controller: _emailController,
                  decoration: InputDecoration(hintText: "E-Mail"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                    if (text.isEmpty || !text.contains("@"))
                      return "E-mail inválido";
                    else
                      return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  autocorrect: false,
                  controller: _passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Senha",
                  ),
                  validator: (text) {
                    if (text.isEmpty || text.length < 6)
                      return "Senha inválida";
                    else
                      return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  autocorrect: false,
                  controller: _addressController,
                  decoration: InputDecoration(hintText: "Endereço"),
                  validator: (text) {
                    if (text.isEmpty)
                      return "Endereço inválido";
                    else
                      return null;
                  },
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                    child: Text(
                      "Criar Conta",
                      style: TextStyle(fontSize: 18),
                    ),
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Map<String, dynamic> userData = {
                          "name": _nameController.text,
                          "email": _emailController.text,
                          "address": _addressController.text
                        };

                        model.signUp(
                            userData: userData,
                            pass: _passController.text,
                            onSuccess: _onSuccess,
                            onFail: _onFail);
                      }
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void _onSuccess() {}

  void _onFail() {}
}
