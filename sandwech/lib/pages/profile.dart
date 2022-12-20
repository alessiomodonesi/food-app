import 'package:flutter/material.dart';
import 'package:sandwech/utils/GNav.dart';
import 'package:sandwech/utils/utils.dart';

class ProfilePage extends StatefulWidget {
  final int userID;

  const ProfilePage(this.userID, {super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String nomeUtente = "";
  String cognomeUtente = "";

  @override
  void initState() {
    super.initState();
    getUser(widget.userID.toString()).then(
        (value) => setState(() {
              nomeUtente = value.name;
              cognomeUtente = value.surname;
            }), onError: (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Sending Message"),
      ));
    });
  }

  String iniziali(String nome, String cognome) {
    if (nome.isEmpty && cognome.isEmpty) {
      return "";
    }
    String profilo = nome[0].toUpperCase() + cognome[0].toUpperCase();
    return profilo;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 80)),
              Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                      ),
                      child: Center(
                        child: Text(
                          iniziali(nomeUtente, cognomeUtente),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 100,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )),
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "$nomeUtente $cognomeUtente",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: GNavi(1, widget.userID),
    );
  }
}
