import 'package:flutter/material.dart';
import 'package:flutteriddaapp/icons/custom_icons.dart';
import '../my_flutter_app_icons.dart';

class ContactPage extends StatelessWidget {
  final String _duyuru =
      "Duyuru ve Kampanyaları kaçırmamak için bizi sosyal medyadan takip etmeyi unutma!";

  final String _oneri =
      "Öneri, soru, görüşleriniz ve eleştirileriniz için aşağıdaki mail adresimize mail atabilirsiniz.";

  final String _socialMedia1Adress = "proanaliznet";
  final String _socialMedia2Adress = "protahmin1";
  final String _proanalizMailAdress = "yardim@proanaliz.net";
  final double _iconSize = 28;
  final String _logo = "assets/images/logo.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _item1,
          _item2,
          Container(),
        ],
      ),
    );
  }

  Widget get _appBar => AppBar(
    elevation: 0,
    // centerTitle: true,
    title: _appBarImages,
    //  bottom: _customTabBar,
  );

  Widget get _appBarImages => Image.asset(
    _logo,
    height: 32,
  );

  EdgeInsetsGeometry get _socialMediaPadding =>
      EdgeInsets.only(left: 2.0, top: 14);

  Widget get _item1 => Container(
        margin: _itemsMargin,
        child: Column(
          children: [
            _oneriText,
            _proanalizIconAndMailText,
          ],
        ),
      );

  TextStyle get _bilgilendiriciMetinTextStyle =>
      TextStyle(fontSize: 18, color: Colors.yellow);

  Widget get _oneriText => Container(
        child: Text(
          _oneri,
          //  style: TextStyle(fontSize: 24, color: Colors.white),
          style: _bilgilendiriciMetinTextStyle,
        ),
      );

  TextStyle get _socialMediaTextStyle =>
      TextStyle(color: Colors.white, fontSize: 15);

  Widget get _proanalizIconAndMailText => Container(
        margin: _socialMediaPadding,
        child: Row(
          children: [
            Icon(
              Icons.mail_outline,
              color: Colors.white,
              size: _iconSize,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                _proanalizMailAdress,
                style: _socialMediaTextStyle,
              ),
            ),
          ],
        ),
      );

  EdgeInsetsGeometry get _itemsMargin => EdgeInsets.symmetric(horizontal: 15);
  Widget get _item2 => Container(
        margin: _itemsMargin,
        child: Column(
          children: [
            _item2Text,
            _item2Items,
           // _socialMedia2,
          ],
        ),
      );

  Widget get _item2Text => Text(_duyuru, style: _bilgilendiriciMetinTextStyle);

  Widget get _item2Items => Container(
        margin: _socialMediaPadding,
        child: _socialMedia1,
      );

  Widget get _socialMedia1 => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            CustomIcons.youtube,
            color: Colors.white,
          ),
          Icon(
            CustomIcons.twitter,
            color: Colors.white,
          ),
          Icon(
            CustomIcons.facebook,
            color: Colors.white,
          ),
          Icon(
            CustomIcons.instagram,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              _socialMedia1Adress,
              style: _socialMediaTextStyle,
            ),
          ),
        ],
      );

  Widget get _socialMedia2 => Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: _socialMediaPadding,
            child: Icon(
              MyFlutterApp.twitter,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: _socialMediaPadding,
            child: Text(
              _socialMedia2Adress,
              style: _socialMediaTextStyle,
            ),
          ),
        ],
      );
}
