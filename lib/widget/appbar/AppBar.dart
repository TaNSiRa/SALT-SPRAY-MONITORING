import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//--------------------------------------------- Bloc
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/LoginEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../page/P1DASHBOARD/P01DASHBOARDMAIN.dart';
// import 'package:tpk_login_arsa_01/script/bloc/login/login_bloc.dart';
// import 'package:tpk_login_arsa_01/script/bloc/login/login_event.dart';

//---------------------------------------------

String pageactive = '';

class App_Bar extends StatefulWidget {
  App_Bar({Key? key}) : super(key: key);

  @override
  _App_BarState createState() => _App_BarState();
}

class _App_BarState extends State<App_Bar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      color: Color(0xff0b1327),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Logo2(),
          Logo1(),
          Spacer(),
          //Text(MediaQuery.of(context).size.width.toString()),
          //Text("  |  <--->  |  " + current_page.toString()),
          Spacer(),
          Pack_topright_bar(),
        ],
      ),
    );
  }

  ///###################################################################################
}

class Logo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: InkWell(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.menu_rounded,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

//============================================================
class Logo1 extends StatelessWidget {
  const Logo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Container(
        color: Color(0xff0b1327),
        child: Text(
          selectpage.isEmpty ? 'SALT SPRAY MONITORING SYSTEM' : selectpage,
          style: TextStyle(
            fontFamily: 'Mitr',
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            letterSpacing: 0,
          ),
        ),
      ),
    );
  }
}

class Pack_topright_bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
          // width: 150,
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            USERDATA.NAME,
            style: TextStyle(
              fontFamily: 'Mitr',
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Time_(),
          Icon_bell(),
          Icon_profile()
        ],
      )),
    );
  }
}

class Icon_bell extends StatelessWidget {
  const Icon_bell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 24,
      // height: 24,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Image.asset("assets/icons/icon-notifications.png"),
      ),
    );
  }
}

class Icon_profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        LoginContext.read<Login_Bloc>().add(Logout());
        timer?.cancel();
      },
      child: Icon(
        Icons.logout,
        size: 24,
        color: Colors.white,
      ),
    );
  }
}

class Time_ extends StatefulWidget {
  Time_({Key? key}) : super(key: key);

  @override
  _Time_State createState() => _Time_State();
}

class _Time_State extends State<Time_> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        return Center(
          child: Text(
            DateFormat(' hh:mm a').format(DateTime.now()),
            style: TextStyle(
              fontFamily: 'Mitr',
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
            ),
          ),
        );
      },
    );
  }
}
