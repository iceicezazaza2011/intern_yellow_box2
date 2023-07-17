import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Login.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({super.key});

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: InkWell(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  LoginPage(),
            ),
          );
        },
        child: Container(
          width: 102,
          height: 44,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xff717171),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Icon(
                Icons.logout,
                color: Color(0xff717171),
              ),
              SizedBox(width: 4),
              Text(
                'Logout',
                style: TextStyle(
                  color: Color(0xff717171),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
