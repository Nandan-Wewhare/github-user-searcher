import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_users/screens/user_details.dart';
import 'package:github_users/widgets/home_screen_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isUserFound = false;
  final _controller = TextEditingController();
  var userData;

  void startSearch() async {
    if (_formKey.currentState.validate()) {
      setState(() => _isLoading = true);
      var response =
          await http.get('https://api.github.com/users/${_controller.text}');
      userData = json.decode(response.body);
      if (userData['id'] != null) {
        setState(() => _isUserFound = true);
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            backgroundColor: Colors.white,
            content: Row(
              children: [
                Icon(
                  Icons.verified,
                  color: Colors.green[600],
                ),
                Text(
                  ' User found',
                  style: GoogleFonts.ubuntu(color: Colors.black),
                  textScaleFactor: 1.1,
                ),
              ],
            ),
            behavior: SnackBarBehavior.floating,
            action: SnackBarAction(
              onPressed: () => _scaffoldKey.currentState.hideCurrentSnackBar(),
              label: 'OK',
            ),
          ),
        );
      } else {
        setState(() => _isUserFound = false);
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            backgroundColor: Colors.white,
            content: Row(
              children: [
                Icon(
                  Icons.clear,
                  color: Colors.red,
                ),
                Text(
                  'User not found',
                  style: GoogleFonts.ubuntu(color: Colors.black),
                  textScaleFactor: 1.1,
                ),
              ],
            ),
            behavior: SnackBarBehavior.floating,
            action: SnackBarAction(
              onPressed: () => _scaffoldKey.currentState.hideCurrentSnackBar(),
              label: 'OK',
            ),
          ),
        );
      }
    }
    setState(() {
      _isLoading = false;
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black26,
      floatingActionButton: _isUserFound && !_isLoading
          ? FloatingActionButton.extended(
              label: Text('View Details',
                  textScaleFactor: 1.2,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w400)),
              onPressed: () {
                _scaffoldKey.currentState.hideCurrentSnackBar();
                FocusScope.of(context).unfocus();
                setState(() => _isUserFound = false);
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => UserDetails(
                      userData: userData,
                    ),
                  ),
                );
              },
              icon: Icon(Icons.person),
              backgroundColor: Colors.white38,
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              HomeScreenWidgets().buildLogo(),
              HomeScreenWidgets().buildTitle(),
              HomeScreenWidgets().buildUsernameInput(_formKey, _controller),
              !_isLoading
                  ? HomeScreenWidgets().buildGetButton(startSearch)
                  : CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
