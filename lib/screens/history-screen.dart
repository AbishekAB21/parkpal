import 'package:flutter/material.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:parkpal/utils/fontstyles.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: appcolor.backgroundColor,
      
        appBar: AppBar(
          toolbarHeight: 20,
          backgroundColor: appcolor.backgroundColor,
          bottom: TabBar(
          dividerColor: appcolor.backgroundColor,
          labelStyle: Fontstyles.ContentTextStyle2(context),
          unselectedLabelStyle: Fontstyles.ContentTextStyle4(context),
          indicatorColor: appcolor.successColor,
          labelColor: appcolor.successColor,
          tabs: [
          Tab(text: "Active bookings",),
          Tab(text: "Previous bookings",)
        ]),
        ),
        
        body: TabBarView(children: [
          Center(child: Text("Active"),),
          Center(child: Text("Previous"),),
        ])
      ),
    );
  }
}