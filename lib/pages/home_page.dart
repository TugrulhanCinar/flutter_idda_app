import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutteriddaapp/icons/custom_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'contact_page.dart';
import 'file:///E:/flutterProject/flutter_idda_app/lib/pages/kupon_page.dart';
import '../helper.dart';
import 'canli_kupon_page.dart';
import 'tekli_kupon_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _padding = EdgeInsets.only(top: 18, left: 25, bottom: 40);
  final String _logo = "assets/images/logo.png";
  int selectedIndex = 1;
  var pages = [CanliKuponPage(), TekliKuponPage(), KuponPage()];
  final  url = 'https://proanaliz.net';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawerMenu,
      bottomNavigationBar: _bottomNavigationBar,
      //bottomNavigationBar: _bottomNavigationBar3,
      appBar: _appBar,
      body: pages[selectedIndex],
      //body: ContactPage(),
    );
  }

  Widget get _appBar => AppBar(elevation: 0, title: _appBarImages);

  Widget get _appBarImages => Image.asset(_logo, height: 32);

  Widget get _bottomNavigationBar => FFNavigationBar(
        theme: _bottomNavigationBarTheme,
        selectedIndex: selectedIndex,
        items: _navigationBarItems,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      );

  FFNavigationBarTheme get _bottomNavigationBarTheme => FFNavigationBarTheme(
        barBackgroundColor: Helper.anaRenk,
        selectedItemBorderColor: Colors.white,
        selectedItemBackgroundColor: Helper.anaRenk2,
        selectedItemLabelColor: Colors.white,
        unselectedItemLabelColor: Colors.white,
      );

  List<FFNavigationBarItem> get _navigationBarItems => [
        _navigationBarItem("Canlı", CustomIcons.whistle),
        _navigationBarItem("Tekli", CustomIcons.paperPin),
        _navigationBarItem("Kupon", CustomIcons.list),
      ];

  FFNavigationBarItem _navigationBarItem(String text, IconData icon) =>
      FFNavigationBarItem(
        iconData: icon,
        // selectedBackgroundColor: Helper.anaRenk,
        // selectedLabelColor: Colors.white,
        label: text,
      );

  Widget get _drawerMenu => Drawer(child: _drawerMenuListItem);

  Widget get _drawerMenuListItem => Container(
        color: Helper.anaRenk,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                children: [
                  //  _drawerHeader,
                  _drawerLogo,
                  _drawerItem,
                ],
              ),
            ),
            //      _drawerLogo2,
          ],
        ),
      );

  Widget get _drawerItem => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /*    listTileElement(Icons.home, "Ana Sayfa", () {
            Navigator.pop(context);
          }),*/
          listTileElement(Icons.comment, "Bize Ulaşın", () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContactPage()));
          }),
          listTileElement(Icons.star, "Bizi Yorumla", () {
            Navigator.pop(context);
          }),
          listTileElement(Icons.alternate_email, "proanaliz.net", () {
            Navigator.pop(context);
            _launchURL();
          },
          )
        ],
      );
  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Widget listTileElement(
      IconData iconData, String text, GestureTapCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: ListTile(
        leading: Icon(
          iconData,
          size: 28,
          color: Colors.white,
        ),
        title: Text(
          text,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontStyle: FontStyle.normal,
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  Widget get _drawerLogo => Container(
        padding: _padding,
        child: Image.asset(
          _logo,
          alignment: Alignment.centerLeft,
          height: 32,
        ),
      );
}
