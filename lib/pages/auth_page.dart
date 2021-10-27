import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/components/auth_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(color: Colors.black),
        ),
        Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 70,
                ),
                //cascade operator
                transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepOrange.shade900,
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                      blurRadius: 8,
                      color: Colors.white24,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: const Text(
                  'Minha Loja',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Anton',
                    color: Colors.white,
                  ),
                ),
              ),
              const AuthForm(),
            ],
          ),
        )
      ],
    ));
  }
}
