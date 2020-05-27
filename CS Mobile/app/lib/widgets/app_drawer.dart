import 'package:app/blocs/authentication/authentication.dart';
import 'package:app/models/user.dart';
import 'package:app/pages/account/account_page.dart';
import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final _authBloc = BlocProvider.of<AuthenticationBloc>(context);

    // ignore_for_file: unused_element
    void dispose() {
      _authBloc.close();
    }

    return Drawer(
      elevation: 1000.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              margin: EdgeInsets.only(top: 110.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, ' + user.firstName + ' ' + user.lastName,
                    style: TextStyle(color: kTertiaryColour, fontSize: 20),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('lib/assets/app-icon.png'))),
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.userShield,
              color: kSecondaryColour,
            ),
            title: Text('Account'),
            onTap: () => {
              Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (context) => AccountPage(),
                ),
              ),
            },
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.cog,
              color: kSecondaryColour,
            ),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.commentDots,
              color: kSecondaryColour,
            ),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.signOutAlt,
              color: kSecondaryColour,
            ),
            title: Text('Logout'),
            onTap: () => {
              _authBloc.add(
                UserLoggedOut(),
              ),
            },
          ),
        ],
      ),
    );
  }
}
