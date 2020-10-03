import 'package:flutter/material.dart';
import 'package:flutteriddaapp/common_widget/canli_tekli_details_page.dart';
import 'package:flutteriddaapp/models/kuponModel.dart';
import '../helper.dart';

class TekliCanliCardModel extends StatelessWidget {
  final KuponElement kuponElement;
  final double radius;
  final EdgeInsetsGeometry textPadding;
  final String kuponTitle;
  final BuildContext context;

  static const defaultListTileTitleItemWPadding =
      EdgeInsets.only(left: 8.0, top: 3, bottom: 2);
  static const defaultTextPadding = EdgeInsets.all(12);

  TekliCanliCardModel({
    //  @required this.altbarItem2,
    @required this.kuponElement,
    @required this.kuponTitle,
    @required this.context,
    Key key,
    this.radius: 12,
    this.textPadding: defaultTextPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _listTile;
  }

  Widget get _listTile => ListTile(
        title: _listTileTitle,
        subtitle: _listSubTileTitle,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => MacDetailsPage(
                title: kuponTitle,
                kuponElement: kuponElement,
              ),
            ),
          );
        },
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
    var text = kuponElement.durum == "0"
        ? "Tahmini Görmek için tıklayınız"
        : kuponElement.tahmin + " - " + kuponElement.oran.toString() + " Oran";

    return Expanded(
      flex: 4,
      child: Container(
        padding: textPadding,
        decoration: BoxDecoration(
          color: kuponElement.durum == "0" ? Colors.yellow : Helper.anaRenk,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(radius),
          ),
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 14,
              color: kuponElement.durum == "0" ? Colors.black : Colors.white,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }



  Widget _itemEnAltBarItem2(String text) {
    Color color;
    Widget aaa;
    if (kuponElement.durum == "0") {
      ///Beklemede
      color = Helper.anaRenk;
      aaa = Container(
        child: Text(
          "Ücretsiz",
          style: TextStyle(
              fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );
    } else if (kuponElement.durum == "1") {
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
    } else if (kuponElement.durum == "2") {
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
    }
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
        trailing: Text(kuponElement.macTarih),
      ),
    );
  }

  Widget get beyazAlan1TitleText =>
      Text(kuponElement.birinciTakim + "-" + kuponElement.ikinciTakim);

  Widget get beyazAlan1SubTitleText => Text(
        kuponElement.lig,
      );
}
