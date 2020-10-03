import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'file:///E:/flutterProject/flutter_idda_app/lib/pages/kupon_page.dart';
import '../helper.dart';
import 'canli_kupon_page.dart';
import 'tekli_kupon_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final padding = EdgeInsets.only(top: 10, left: 30, bottom: 40);
  final String _logo = "assets/images/logo.png";
  int selectedIndex = 1;
  var pages = [CanliKuponPage(), TekliKuponPage(), KuponPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawerMenu,
      bottomNavigationBar: _bottomNavigationBar,
      appBar: _appBar,
      //body: pages[selectedIndex],
      body: pages[selectedIndex],
    );
  }

  Widget get _bottomNavigationBar1 =>
      BottomNavigationBar(
        unselectedItemColor: Colors.yellow,
        backgroundColor: Colors.red,
        items: [
          BottomNavigationBarItem(
              icon: Opacity(opacity: 0, child: Icon(Icons.pages)),
              title: Text("CANLI")),
          BottomNavigationBarItem(
              icon: Icon(Icons.pages), title: Text("CANLI")),
          BottomNavigationBarItem(
              icon: Icon(Icons.pages), title: Text("CANLI")),
        ],
      );

  Widget get _bottomNavigationBar =>
      FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Helper.anaRenk,
          unselectedItemBackgroundColor: Colors.red,
          //   selectedItemBorderColor: Colors.white10,
          selectedItemBackgroundColor: Colors.yellow[300],
          // selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
        ),
        selectedIndex: selectedIndex,
        items: _navigationBarItem,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      );

  List<FFNavigationBarItem> get _navigationBarItem =>
      [
        FFNavigationBarItem(
          // iconData: Icons.calendar_today,
          label: 'Canlı',
        ),
        FFNavigationBarItem(
          //   iconData: Icons.people,
          label: 'Tekli',
        ),
        FFNavigationBarItem(
          //  iconData: Icons.attach_money,
          label: 'Kupon',
        ),
      ];

  Widget get _drawerMenu => Drawer(child: _drawerMenuListItem);

  Widget get _drawerMenuListItem =>
      Container(
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

  Widget get _drawerItem =>
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          listTileElement(Icons.home, "Ana Sayfa"),
          listTileElement(Icons.comment, "Bize Ulaşın"),
          listTileElement(Icons.star, "Bizi Yorumla"),
          listTileElement(Icons.alternate_email, "proanaliz.net"),
        ],
      );

  Widget listTileElement(IconData iconData, String text) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 28,
        color: Colors.white,
      ),
      title: Text(
        text,
        textAlign: TextAlign.left,
        style: Theme
            .of(context)
            .textTheme
            .bodyText1,
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  /* Widget get _drawerLogo2 => Container(
        padding: padding,
        alignment: Alignment.centerLeft,
        child: Image.asset(
          _logo,
          alignment: Alignment.centerLeft,
          height: 32,
        ),
      );*/

  Widget get _drawerLogo =>
      Container(
        padding: padding,
        child: Image.asset(
          _logo,
          alignment: Alignment.centerLeft,
          height: 32,
        ),
      );

  Widget get _appBar =>
      AppBar(
        elevation: 0,
        // centerTitle: true,
        title: _appBarImages,
        //  bottom: _customTabBar,
      );

  Widget get _appBarImages =>
      Image.asset(
        _logo,
        height: 32,
      );
}
