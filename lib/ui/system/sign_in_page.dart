import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nexusos_sdk/nexusos_sdk.dart';

class SignIn extends StatelessWidget {
  final UserManager _um = UserManager();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      color: Colors.black87,
      body: SizedBox(
        height: 120,
        width: 240,
        child: Row(
          children: [
            _buildUserInput(),
            _buildSend(context),
          ],
        ),
      ),
    );
  }

  _buildUserInput() {
    return Flexible(
      flex: 3,
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(hintText: 'username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(hintText: 'password'),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () => _createUser(),
                child: Text('Create User'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildSend(BuildContext context) {
    return Flexible(
      child: FlatButton.icon(
        onPressed: () => _validateLogin(
          _usernameController.text,
          EncryptedString(toEncrypt: _passwordController.text),
          context,
        ),
        icon: Icon(Icons.send),
        label: Text(''),
      ),
    );
  }

  // TODO: Move else where ie. Settings/Admin controller
  _createUser() {
    _um.createUser(
      username: _usernameController.text,
      password: EncryptedString(toEncrypt: _passwordController.text),
    );
  }

  _validateLogin(
      String username, EncryptedString password, BuildContext context) async {
    final sb = SnackBar(content: Text('Incorrect Username/Password'));
    if (username.isEmpty) {
      _clearInput();
      // Show snackbar indicating invalid input.
      // TODO: Error Scaffold.of() called on context that does not contain a Scaffold.
      ScaffoldMessenger.of(context).showSnackBar(sb);
      return;
    }
    final user = _um.login(username, password);
    if (user == null) {
      _clearInput();
      // Show snackbar indicating generic username/password issue.
      ScaffoldMessenger.of(context).showSnackBar(sb);
      return;
    }

    // TODO: Fix Notification Manager and provider compatibility
    NotificationManager().currentUser = _um.current;
    // Was coming up as null
    // Provider.of<NotificationManager>(context, listen: false).currentUser = _um.current;
    await Navigator.popAndPushNamed(context, 'desktop', arguments: user);
  }

  _clearInput() {
    _usernameController.clear();
    _passwordController.clear();
  }
}
