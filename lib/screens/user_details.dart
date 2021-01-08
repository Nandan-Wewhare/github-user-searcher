import 'package:flutter/material.dart';
import 'package:github_users/widgets/user_detail_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_slide_animation/number_slide_animation.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetails extends StatelessWidget {
  final userData;
  UserDetails({@required this.userData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          userData['login'],
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserWidgets().buildUserImage(context, userData),
              UserWidgets().buildUserBio(userData['bio']),
              UserWidgets().buildCustomDivider(),
              UserWidgets().buildCustomRow('NAME:', userData['name']),
              UserWidgets()
                  .buildCustomRow('USER ID:', userData['id'].toString()),
              UserWidgets().buildCustomRow('LOCATION:', userData['location']),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    UserWidgets().buildLabel('PUBLIC REPOS:'),
                    NumberSlideAnimation(
                      number: userData['public_repos'].toString(),
                      textStyle: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ),
              Spacer(),
              UserWidgets().buildButton(
                () => launch(userData['html_url']),
                'Go to Profile',
                Icon(Icons.info),
                Colors.green[300],
              ),
              UserWidgets().buildButton(
                () => Navigator.pop(context),
                'Go Back',
                Icon(Icons.chevron_left),
                Colors.red[300],
              )
            ],
          ),
        ),
      ),
    );
  }
}
