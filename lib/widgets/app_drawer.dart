import 'package:daily_spending/global/global.dart';
import 'package:flutter/material.dart';

import 'items/drawerHeader.dart';
import 'items/drawerItem.dart';

class AppDrawer extends StatelessWidget {
  final int total;

  const AppDrawer({
    Key key,
    this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          MyDrawerHeader(),
          ...(GlobalParameter.menus).map((item) =>
              DrawerItem(item['title'], item['route'], item['icon'])
          ),
          
          
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: 
               FlatButton(    
                onPressed: (){  
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/deconnexion");
                },
                color: Colors.orange,
                padding: EdgeInsets.only(right: 100, left: 100),
                child: Column( // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: 17,
                        ),
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.logout),
                          ),
                          TextSpan(
                            text: 'Logout',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ),
            ),
        ],
      ),
    );
  }
}

/*
    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            'Massroufi',
            style: Theme.of(context).appBarTheme.textTheme.headline1,
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/profile.png"),
              ),
            
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text("Home"),
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(HomeScreen.routeName);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.mail),
                    title: Text("Contact Us"),
                    onTap: () async {
                      String url = Uri.encodeFull(
                          "mailto:mufaddalshakir55@gmail.com?subject=NeedHelp&body=Contact Reason: ");
                      if (await canLaunch(url)) {
                        Navigator.of(context).pop();
                        await launch(url);
                      }
                    },
                  ),
                  /*
                  ListTile(
                    leading: Image.asset(
                      'assets/images/github.png',
                      color: Colors.grey,
                    ),
                    title: Text("Contribute"),
                    onTap: () async {
                      String url = Uri.encodeFull(
                          "https://github.com/Mufaddal5253110/DailySpending.git");
                      if (await canLaunch(url)) {
                        Navigator.of(context).pop();
                        await launch(url);
                      }
                    },
                  ),
                  */
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Parameters"),
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(HomeScreen.routeName);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Total: $total DH',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}*/