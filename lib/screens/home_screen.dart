import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signauth/screens/signin_screen.dart';
import 'package:signauth/screens/signup_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
                child: Text("${FirebaseAuth.instance.currentUser!.email}"),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
                child: ElevatedButton(
                  child: const Text("Déconnexion"),
                  onPressed: () {
                    print("Déconnexion réussie ! ");
                    FirebaseAuth.instance.signOut().then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()));
                    });
                  },
                ),
              )
            ],
          )),
    );
  }
}
