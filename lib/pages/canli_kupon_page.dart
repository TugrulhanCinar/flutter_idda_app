import 'package:flutter/material.dart';
import 'package:flutteriddaapp/common_widget/tekli_ve_canli_card_model.dart';
import 'package:provider/provider.dart';
import '../view_models/kupon_view_model.dart';

class CanliKuponPage extends StatelessWidget {
  final String kuponTitle = "Canli";
  final String ayracText = "Sonuçlanmış Canlilar";

  Widget build(BuildContext context) {
    return Consumer<KuponViewModel>(
      builder: (BuildContext context, KuponViewModel value, Widget child) {
        if (value.state == KuponModelState.Busy) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else
          return canliKuponsListView(value);
      },
    );
  }

  Widget canliKuponsListView(KuponViewModel value) {
    return ListView.separated(
      itemCount: value.allCanliKuponsItem.length + 1,


      separatorBuilder: (context, index) {
        return Container();
      },
      itemBuilder: (context, index) {
        var bottom = index == (value.canliGunlukCouponInt + 1) ? 14.0 : 40.0;
        var top = index == (value.canliGunlukCouponInt + 1) ? 14.0 : 20.0;
        if (index < value.canliGunlukCouponInt) {
          return Padding(
            padding: const EdgeInsets.only(top: 14.0, bottom: 14),
            child: TekliCanliCardModel(
              kuponElement: value.allCanliKuponsItem[index].kupon[0],
              kuponTitle: "Canli",
              context: context,
            ),
          );
        } else if (index == value.canliGunlukCouponInt + 1) {
          return _item;
        } else {
          return Padding(
            padding: EdgeInsets.only(top: top, bottom: bottom),
            child: TekliCanliCardModel(
              context: context,
              kuponElement: value.allCanliKuponsItem[index - 1].kupon[0],
              kuponTitle: "Canli",
            ),
          );
        }
      },
    );
  }

  Widget get _item => Container(
        width: 150,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        margin: EdgeInsets.symmetric(horizontal: 40),
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Text(
          ayracText,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );
}
