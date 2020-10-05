import 'package:flutter/material.dart';
import 'package:flutteriddaapp/data/kupons_client.dart';
import 'package:flutteriddaapp/models/kuponModel.dart';
import '../locator.dart';

enum KuponModelState { Idle, Busy, Loaded }
///Kupondurum:0 = beklemede
///Kupondurum:1 = kazandı
///Kupondurum:0 = kaybetti
class KuponViewModel with ChangeNotifier{
  Kupon kupon;


  ///Canlı:
  List<Coupon> _gecmisCoupon =List();
  List<Coupon> _gunlukCoupon=List();
  List<Coupon> allCanliKuponsItem =List();
  ///tekli:
  List<Coupon> _gecmisTekliCoupon=List();
  List<Coupon> _gunlukTekliCoupon=List();
  List<Coupon> allTekliKuponsItem =List();
  ///canli:
  List<Coupon> _canliGecmisCoupon=List();
  List<Coupon> _canliGunlukCoupon=List();
  List<Coupon> allKuponsItem =List();



  KuponModelState _state ;
  final _kuponRepository = locator<KuponClient>();

  KuponViewModel(){

    _state = KuponModelState.Idle;
    kupon = Kupon();
    fetchAllKupons();
  }


  List<Coupon> get gecmisCoupon => _gecmisCoupon;

  KuponModelState get state => _state;

  set state(KuponModelState value) {
    _state = value;
    notifyListeners();
  }
  Future<Kupon> fetchAllKupons() async{
    state = KuponModelState.Busy;
    kupon = await _kuponRepository.fetchAllKupons();
    kuponuAyir();
    state = KuponModelState.Loaded;
    return kupon;
  }

  void kuponuAyir() {
    //_coupon = kupon.coupons;
    KuponElement element;
    for(Coupon coupon in kupon.coupons ){
      element = coupon.kupon[0];

      if(coupon.canli){
        element.durum == "0"
            ?  _canliGunlukCoupon.add(coupon)
            : _canliGecmisCoupon.add(coupon);

      }else if(coupon.kupon.length == 1){
        element.durum == "0"
            ?  _gunlukTekliCoupon.add(coupon)
            : _gecmisTekliCoupon.add(coupon);
      }else{
        coupon.kuponDurum == "0"
            ?  _gunlukCoupon.add(coupon)
            :   _gecmisCoupon.add(coupon);
      }
    }

    ///Kuponlar:
    for(Coupon gecici in _gunlukCoupon){
      allKuponsItem.add(gecici);
    }

    for(Coupon gecici in _gecmisCoupon){
      allKuponsItem.add(gecici);
    }
    ///Tekliler:
    for(Coupon gecici in _gunlukTekliCoupon){
      allTekliKuponsItem.add(gecici);
    }
    for(Coupon gecici in _gecmisTekliCoupon){
      allTekliKuponsItem.add(gecici);
    }
    ///Canlılar:
    for(Coupon gecici in _canliGunlukCoupon){
      allCanliKuponsItem.add(gecici);
    }
    for(Coupon gecici in _canliGecmisCoupon){
      allCanliKuponsItem.add(gecici);
    }
  }



  ///Kuponlar:
  int get gunlukCouponInt => _gunlukCoupon.length;


  ///Tekliler:
  int get tekliGecmisCouponInt  => _gecmisTekliCoupon.length;

  int get tekliGunlukCouponInt  => _gunlukTekliCoupon.length;

  ///Canlılar:

  int get canliGecmisCouponInt  => _canliGecmisCoupon.length;

  int get canliGunlukCouponInt  => _canliGunlukCoupon.length;
}

