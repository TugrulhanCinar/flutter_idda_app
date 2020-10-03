import 'package:flutter/material.dart';
import 'package:flutteriddaapp/helper.dart';
import 'package:flutteriddaapp/models/kuponModel.dart';

class MacDetailsPage extends StatelessWidget {
  final KuponElement kuponElement;
  final String title;
  final double radius;

  const MacDetailsPage({
    Key key,
    @required this.kuponElement,
    this.title: "Title",
    this.radius: 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [_titleWidget(context), _content(context)],
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
        "assets/images/logo.png",
        height: 32,
      );


  Decoration get topBorderDecoration => BoxDecoration(
    color: Helper.anaRenk2,
    borderRadius: topBorderRadius,
  );

  BorderRadius get topBorderRadius =>  BorderRadius.only(
    topLeft: Radius.circular(radius),
    topRight: Radius.circular(radius),
  );



  Widget _titleWidget(BuildContext context) {

    Widget gecici ;
    if(kuponElement.durum =="1"){
      gecici = _kazandi;
    }else if(kuponElement.durum =="2"){
      gecici = _kaybetti;
    }else{
      gecici =Container();
    }

    return Container(


      decoration: topBorderDecoration,
      margin: titleMargin(context),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _titleText,
            gecici,

          ],
        ),
      ),
    );
  }

  EdgeInsets titleMargin(BuildContext context) {
    return EdgeInsets.only(
      left: MediaQuery.of(context).size.width / 10,
      right: MediaQuery.of(context).size.width / 10,
      top: 15,
    );
  }

  Widget get _kazandi => Container(
        color: Colors.green[600],
        alignment: Alignment.center,
        child: Icon(
          Icons.check,
          size: 25,
          color: Colors.white,
        ),
      );

  Widget get _kaybetti => Container(
        color: Colors.red[800],
        alignment: Alignment.center,
        child: Icon(
          Icons.clear,
          size: 25,
          color: Colors.white,
        ),
      );

  Widget get _titleText => Title(
        color: Colors.white,
        title: title,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      );

  Container _content(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(radius),
          bottomRight: Radius.circular(radius),
        ),
      ),
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 10,
        right: MediaQuery.of(context).size.width / 10,
      ),
      width: MediaQuery.of(context).size.width,
      child: _items,
    );
  }

  Widget get _items => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          takimLigTarih,
          _tahmin,
          _yorum,
        ],
      );

  Widget get _tahmin => ListTile(
        title: Text("Tahmin:"),
        subtitle: Text(
          kuponElement.tahmin +
              "-" +
              kuponElement.oran.toStringAsPrecision(2) +
              " Oran",
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      );

  Widget get _yorum => Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: ListTile(
            title: Text("Yorumumuz:"), subtitle: Text(kuponElement.macYorum)),
      );

  Widget get takimLigTarih => ListTile(
        title: Text(kuponElement.birinciTakim + "-" + kuponElement.ikinciTakim),
        subtitle: Text(kuponElement.lig),
        trailing: Text(kuponElement.macTarih),
      );
}
