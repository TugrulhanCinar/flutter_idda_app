import 'package:flutter/material.dart';
import 'package:flutteriddaapp/helper.dart';
import 'package:flutteriddaapp/models/kuponModel.dart';

class KuponDetailsPage extends StatelessWidget {
  final Coupon coupon;
  final String title;
  final double radius;

  const KuponDetailsPage({
    Key key,
    @required this.coupon,
    this.title: "Kupon",
    this.radius: 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleWidget(context),
          _content(context),
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
        "assets/images/logo.png",
        height: 32,
      );

  Decoration get _titleBoxDecoration => BoxDecoration(
        color: Helper.anaRenk2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
        ),
      );

  Widget get titleText => Text(
        title,
        style: TextStyle(
          fontSize: 22,
        ),
      );

  Widget _titleWidget(BuildContext context) {
    Widget gecici;
    if (coupon.kuponDurum == "1") {
      gecici = _kazandi;
    } else if (coupon.kuponDurum == "2") {
      gecici = _kaybetti;
    } else {
      gecici = Container();
    }

    return Container(
      decoration: _titleBoxDecoration,
      margin: margin(context),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Title(
          color: Colors.white,
          title: title,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [titleText, gecici],
          ),
        ),
      ),
    );
  }

  EdgeInsets margin(BuildContext context) {
    return EdgeInsets.only(
      left: MediaQuery.of(context).size.width / 10,
      right: MediaQuery.of(context).size.width / 10,
      top: 15,
    );
  }

  Decoration get _ustBoxDecoration => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(radius),
          bottomRight: Radius.circular(radius),
        ),
      );

  EdgeInsetsGeometry _ustBoxMargin(BuildContext context) {
    return EdgeInsets.only(
      left: MediaQuery.of(context).size.width / 10,
      right: MediaQuery.of(context).size.width / 10,
    );
  }

  Container _content(BuildContext context) {
    return Container(
      decoration: _ustBoxDecoration,
      margin: _ustBoxMargin(context),
      width: MediaQuery.of(context).size.width,
      child: _items,
    );
  }

  Widget get _items => Column(
        children: [
          _takimlar,
          _tahmin,
          _yorum,
        ],
      );

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

  Widget get _takimlar => ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var gecici = coupon.kupon[index];
          return takimLigTarih(gecici);
        },
        separatorBuilder: (context, index) {
          return _divider;
        },
        itemCount: coupon.kupon.length,
      );

  Widget get _divider => Divider(height: 15);

  Widget takimLigTarih(KuponElement kuponElement) {
    return ListTile(
      title: Text(kuponElement.birinciTakim + "-" + kuponElement.ikinciTakim),
      subtitle: Text(kuponElement.lig),
      trailing: Text(kuponElement.macTarih),
    );
  }

  Widget get _tahmin => ListTile(
        title: Text(
          "Toplam Oran: " + coupon.kuponOran.toStringAsPrecision(2),
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      );

  Widget get _yorum => Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: ListTile(
            title: Text("Yorumumuz:"), subtitle: Text(coupon.kuponYorum)),
      );
}
