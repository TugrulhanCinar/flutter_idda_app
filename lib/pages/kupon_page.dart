import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteriddaapp/common_widget/kupon_card_model.dart';
import 'package:flutteriddaapp/view_models/kupon_view_model.dart';
import 'package:provider/provider.dart';

class KuponPage extends StatelessWidget {
  final String kuponTitle = "Kupon";
  final String ayracText = "Sonuçlanmış Kuponlar";

  Widget build(BuildContext context) {
    return Consumer<KuponViewModel>(
        builder: (BuildContext context, KuponViewModel value, Widget child) {
      if (value.state == KuponModelState.Busy) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else
        //todo: düzelt
        
        return value.allKuponsItem.length > 0
            ? testList(value)
            : Center(child: Text("Paylaşılmış kupon Yok",style: TextStyle(color: Colors.white,fontSize: 48),));
    });
  }

  Widget testList(KuponViewModel value) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: value.allKuponsItem.length + 1,
      separatorBuilder: (context, index) {
        return _divider;
      },
      itemBuilder: (context, index) {
        //  var padding = index == (value.gunlukCouponInt ) ? 21.0 :10.0;
        if (index < value.gunlukCouponInt) {
          return Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: gunlukKuponlar(value, index, context),
          );
        } else if (index == value.gunlukCouponInt) {
          return _item;
        } else {
          return sonuclanmisKuponlar(value, index, context);
        }
      },
    );
  }

  Widget gunlukKuponlar(KuponViewModel value, int index, BuildContext context) {
    return KuponCardWidget(
      coupon: value.allKuponsItem[index],
      context: context,
      kuponTitle: "Kupon",
    );
  }

  Widget sonuclanmisKuponlar(
      KuponViewModel value, int index, BuildContext context) {
    return KuponCardWidget(
      coupon: value.allKuponsItem[index - 1],
      context: context,
      kuponTitle: "Kupon",
    );
  }

  Widget get _divider => Divider(height: 30);

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

///  bura ne işe yarıyo bilmiyorum
///
/*


  ListView gecmisKupon(KuponViewModel value) {
    return value.gecmisCoupon.length > 0
        ? ListView.separated(
      itemCount: value.gecmisCoupon.length,

      separatorBuilder: (context,index){
        return Divider(
          height: 15,
        );
      },

      itemBuilder: (context,index){
        return KuponCardWidget(
          kuponTitle: "Kupon",
          context: context,
          coupon: value.gecmisCoupon[index],
        );
      },
    )
        : Text("Henüz Paylaşılmış maç yok ");
  }
 */
