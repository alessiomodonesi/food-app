import 'package:flutter/material.dart';
import 'package:sandwech/utils/size.dart';

Function showDialogError = (context, title, message) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
          title: Text(
            title,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color.fromARGB(255, 158, 11, 0),
            ),
            //style: AppStyle.txtInterBold20,
          ),
          content: Text(
            message,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: getMargin(
                      left: 16,
                      top: 10,
                      right: 16,
                      bottom: 5,
                    ),
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 158, 11, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text('Chiudi'),
                    )),
              ],
            ),
          ],
        ));
