import 'package:flutter/material.dart';

class GlobalParameter{
  static final menus = [
    {
      "title":"Home",
      "route": "/",
      "icon":Icon(Icons.home)
    },
    {
      "title":"Add Transaction",
      "route": "/new_transaction",
      "icon":Icon(Icons.add)
    },
    {
      "title":"OCR",
      "route": "/Ocr",
      "icon":Icon(Icons.camera)
    },
    {
      "title":"Contacts us",
      "route": "/contacts",
      "icon":Icon(Icons.email)
    },
    {
      "title":"QRScan",
      "route": "/qrscan",
      "icon":Icon(Icons.camera)
    },
    /*
    {
      "title":"Github",
      "route": "/github",
      "icon":Icon(Icons.verified_user_sharp)
    },
    */
    {
      "title":"profile",
      "route": "/profile",
      "icon":Icon(Icons.settings)
    },
    {
      "title":"Google maps",
      "route": "/maps",
      "icon":Icon(Icons.map)
    }
  ];
}