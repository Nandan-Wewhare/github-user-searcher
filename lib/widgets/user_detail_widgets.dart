import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserWidgets {
  Padding buildUserImage(BuildContext context, var userData) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Hero(
        tag: 'image',
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 5,
          child: CachedNetworkImage(
            imageUrl: userData['avatar_url'],
            placeholder: (context, url) => Icon(
              Icons.person,
              color: Colors.white,
              size: MediaQuery.of(context).size.height / 5,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLabel(String label) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: Text(
        label,
        textScaleFactor: 1.2,
        style: GoogleFonts.ubuntu(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Text buildCustomText(String text) {
    return Text(
      text ?? 'unavailable',
      textScaleFactor: 1.3,
      style: GoogleFonts.poppins(color: Colors.white),
    );
  }

  Text buildUserBio(String bio) {
    return Text(
      bio ?? 'Bio unavailable',
      textScaleFactor: 1.5,
      textAlign: TextAlign.center,
      style: GoogleFonts.aladin(color: Colors.white),
    );
  }

  Widget buildCustomRow(String labelText, String property) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          UserWidgets().buildLabel(labelText),
          UserWidgets().buildCustomText(property),
        ],
      ),
    );
  }

  RaisedButton buildButton(
      Function action, String buttonText, Icon buttonIcon, Color buttonColor) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: buttonColor,
      onPressed: action,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          buttonIcon,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              buttonText,
              textScaleFactor: 1.2,
              style: GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Container buildCustomDivider() {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: Divider(
        indent: 20,
        endIndent: 20,
        color: Colors.orange,
        thickness: 1,
      ),
    );
  }
}
