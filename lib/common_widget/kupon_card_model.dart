import 'package:flutter/material.dart';
import 'package:flutteriddaapp/common_widget/kupon_details.dart';
import 'package:flutteriddaapp/models/kuponModel.dart';
import '../helper.dart';

class KuponCardWidget extends StatelessWidget {
  final double radius;
  final Coupon coupon;
  final BuildContext context;
  final EdgeInsetsGeometry textPadding = EdgeInsets.all(12);
  final String kuponTitle;


  KuponCardWidget({
    @required this.coupon,
    @required this.kuponTitle,
    @required this.context,
    this.radius: 12,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _listTile;
  }

  Widget get _listTile => ListTile(
        title: _listTileTitle,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => KuponDetailsPage(
                  coupon: coupon,
              ),
            ),
          );
        },
        subtitle: _listSubTileTitle,
      );

  Widget get _listTileTitle => Container(
        decoration: BoxDecoration(
          color: Helper.anaRenk2,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius),
          ),
        ),
        child: _listTileTitleItemWithPadding,
      );

  Widget get _listTileTitleItemWithPadding => Padding(
        padding: EdgeInsets.only(left: 8.0, top: 3, bottom: 2),
        child: Text(
          kuponTitle,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white
          ),
        ),
      );

  Widget get _listSubTileTitle => Column(
        children: [
          _takimTarihVeLig(),
          _itemEnAltBar,
        ],
      );

  Widget get _itemEnAltBar => Row(
        children: [
          _itemEnAltBarItem1(),
          _itemEnAltBarItem2("aa"),
        ],
      );

  Widget _itemEnAltBarItem1() {
    var text = coupon.kuponDurum == "0"
        ? "Tahmini Görmek için tıklayınız"
        : "Toplam Oran: " + coupon.kuponOran.toStringAsPrecision(2);

    return Expanded(
      flex: 4,
      child: Container(
        padding: textPadding,
        decoration: BoxDecoration(
          color: coupon.kuponDurum == "0" ? Colors.yellow : Helper.anaRenk,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(radius),
          ),
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: coupon.kuponDurum == "0" ? Colors.black : Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }



  Color renkBelirle(){
    if (coupon.kuponDurum == "0") {
      ///Beklemede
      return Helper.anaRenk;

    } else if (coupon.kuponDurum == "1") {
      ///Kazandı
      return Colors.green[600];

    } else if (coupon.kuponDurum == "2") {
      ///Kaybetti
     return Colors.red[800];

    }
  }
  Widget iconBelirle(){
    Color color = renkBelirle();
    if (coupon.kuponDurum == "0") {
      ///Beklemede
      return Container(
        child: Text(
          "Ücretsiz",
          style: TextStyle(
              fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );

    } else if (coupon.kuponDurum == "1") {
      ///Kazandı
      return Container(
        color: color,
        alignment: Alignment.center,
        child: Icon(
          Icons.check,
          size: 18,
          color: Colors.white,
        ),
      );

    } else if (coupon.kuponDurum == "2") {
      ///Kaybetti
      return Container(
        color: color,
        alignment: Alignment.center,
        child: Icon(
          Icons.clear,
          color: Colors.white,
          size: 18,
        ),
      );

    }
  }

  Widget _itemEnAltBarItem2(String text) {
    Color color = renkBelirle();
    Widget aaa = iconBelirle();
    /*
    if (coupon.kuponDurum == "0") {
      ///Beklemede
      color = Helper.anaRenk;
      aaa = Container(
        child: Text(
          "Ücretsiz",
          style: TextStyle(
              fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );
    } else if (coupon.kuponDurum == "1") {
      ///Kazandı
      color = Colors.green[600];

      aaa = Container(
        color: color,
        alignment: Alignment.center,
        child: Icon(
          Icons.check,
          size: 18,
          color: Colors.white,
        ),
      );
    } else if (coupon.kuponDurum == "2") {
      ///Kaybetti
      color = Colors.red[800];
      aaa = Container(
        color: color,
        alignment: Alignment.center,
        child: Icon(
          Icons.clear,
          color: Colors.white,
          size: 18,
        ),
      );
    }*/
    return Expanded(
      flex: 1,
      child: Container(
        padding: textPadding,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(radius),
          ),
        ),
        alignment: Alignment.centerLeft,
        // child: altbarItem2,
        child: aaa,
      ),
    );
  }

  Widget _takimTarihVeLig() {
    return Container(
      //padding: textPadding,
      color: Colors.white,
      child: ListTile(
        title: beyazAlan1TitleText,
        subtitle: beyazAlan1SubTitleText,
        trailing: Text(coupon.kuponTarih2),
      ),
    );
  }

  Widget get beyazAlan1TitleText =>
      Text(coupon.kuponOran.toStringAsPrecision(2) + " Oranlı Kupon");

  Widget get beyazAlan1SubTitleText => Text(
        coupon.kuponYorum,
      );
}
