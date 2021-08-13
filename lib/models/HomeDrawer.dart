import 'package:flutter/material.dart';
import '../cubit/registration_cubit.dart';
import 'package:expandable/expandable.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  Widget columnItem(String label) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  Widget expandablePannel(icon, title) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ExpandablePanel(
        header: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(title, style: Theme.of(context).textTheme.headline3),
              ],
            )),
        collapsed: Container(),
        expanded: Column(
          children: [
            columnItem("Company: Housy"),
            columnItem("Address: Pune, India"),
            columnItem("Phone: XXXXXXXXX09"),
            columnItem("Email: XXXXXX@housy.com"),
          ],
        ),
        theme: ExpandableThemeData(
            tapHeaderToExpand: true,
            hasIcon: true,
            iconColor: Colors.blue,
            tapBodyToExpand: true),
      ),
    );
  }

  Widget drawerButton(Icon icon, String title) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextButton.icon(
          onPressed: () {
            RegistrationCubit().updateLoginStatus(false);
            Navigator.of(context).pushReplacementNamed('/');
          },
          icon: icon,
          label: Text(
            title,
            style: Theme.of(context).textTheme.headline3,
          )),
    );
  }

  Widget underline({Color color: Colors.blue}) {
    return SizedBox(
      height: 1,
      width: double.infinity,
      child: Container(
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Theater'),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 200,
                  color: Colors.amber,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Welcome ${RegistrationCubit().getLocaldata()[0]}',
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(color: Colors.amber),
                ),
              ),
              underline(color: Colors.amber),
              expandablePannel(Icons.work, 'Company Info'),
              underline(),
              drawerButton(Icon(Icons.exit_to_app), 'Logout'),
            ],
          ),
        ),
      ),
    );
  }
}
