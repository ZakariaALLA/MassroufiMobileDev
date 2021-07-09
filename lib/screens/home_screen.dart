import 'package:daily_spending/DBhelp/TransactionService.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/transaction.dart';
import './transactions/daily_spendings.dart';
import './transactions/monthly_spendings.dart';
import './transactions/yearly_spendings.dart';
import '../widgets/app_drawer.dart';
import './transactions/weekly_spendings.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(initialIndex: 0, length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                  Navigator.of(context).pushNamed("/new_transaction");
                  TransactionService.getTransactions("Ahmed");
              }
          ),
        ],
        bottom: new TabBar(
          labelStyle: TextStyle(fontSize: 20),
          unselectedLabelStyle: TextStyle(fontSize: 15),
          indicatorColor: Theme.of(context).accentColor,
          tabs: <Widget>[
            new Tab(
              text: "Daily",
            ),
            new Tab(
              text: "Weekly",
            ),
            new Tab(
              text: 'Monthly',
            ),
            new Tab(
              text: 'Yearly',
            ),
          ],
          controller: tabController,
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<Transactions>(context, listen: false)
            .fetchTransactions(),
        builder: (ctx, snapshot) =>
            (snapshot.connectionState == ConnectionState.waiting)
                ? Center(child: CircularProgressIndicator())
                : TabBarView(
                    children: <Widget>[
                      new DailySpendings(),
                      new WeeklySpendings(),
                      new MonthlySpendings(),
                      new YearlySpendings(),
                    ],
                    controller: tabController,
                  ),
      ),
      drawer: Consumer<Transactions>(
        builder: (context, trx, child) {
          return AppDrawer(total: trx.getTotal(trx.transactions));
        },
      ),
    );
  }
}
