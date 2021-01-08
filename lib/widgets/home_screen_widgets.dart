import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenWidgets {
  Widget buildUsernameInput(var _formKey, var _controller) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextFormField(
          style: GoogleFonts.ubuntu(color: Colors.white),
          validator: (value) => value.isEmpty ? 'Required' : null,
          controller: _controller,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            hintText: 'Github username eg:nandan-wewhare',
            hintStyle: GoogleFonts.poppins(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget buildLogo() {
    return Hero(
      tag: 'image',
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 60,
        child: Image.asset('images/logo.png'),
      ),
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Github',
        textScaleFactor: 2.5,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  RaisedButton buildGetButton(Function onClick) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.orange[300],
      onPressed: onClick,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.view_list),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Get User Details',
              textScaleFactor: 1.2,
              style: GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
