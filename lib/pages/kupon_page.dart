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
          } else return testList(value);

        }
    );
  }

  Widget testList(KuponViewModel value) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: value.allKuponsItem.length + 1,
      separatorBuilder: (context, index) {
        return _divider;
      },
      itemBuilder: (context, index) {
        if(index < value.gunlukCouponInt){
          return KuponCardWidget(
            coupon: value.allKuponsItem[index],
            context: context,
            kuponTitle: "Kupon",
          );
        }else if(index == value.gecmisCoupon.length) {
          return _item;
        } else{
         return KuponCardWidget(
            coupon: value.allKuponsItem[index-1],
            context: context,
            kuponTitle: "Kupon",
          );
        }
      },
    );
  }

  Widget get _divider => Divider(height: 30);



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

/*
 Widget gunlukKupon(KuponViewModel value) {

    return value.gunlukCoupon.length > 0
      ?
     ListView.separated(
              itemCount: value.gunlukCoupon.length,
              shrinkWrap: true,
              separatorBuilder: (context,index){
                return Divider(
                  height: 15,
                );
              },

              itemBuilder: (context,index){
                return KuponCardWidget(
                  kuponTitle: "Kupon",
                  coupon: value.gunlukCoupon[index],
                );
              },
            )

     : Text("Henüz Paylaşılmış maç yok ");
  }
 */