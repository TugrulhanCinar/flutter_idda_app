// To parse this JSON data, do
//
//     final kupon = kuponFromJson(jsonString);

import 'dart:convert';

Kupon kuponFromJson(String str) => Kupon.fromJson(json.decode(str));

String kuponToJson(Kupon data) => json.encode(data.toJson());

class Kupon {
  Kupon({
    this.coupons,
  });

  List<Coupon> coupons;

  factory Kupon.fromJson(Map<String, dynamic> json) => Kupon(
    coupons: json["coupons"] == null ? null : List<Coupon>.from(json["coupons"].map((x) => Coupon.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "coupons": coupons == null ? null : List<dynamic>.from(coupons.map((x) => x.toJson())),
  };
}

class Coupon {
  Coupon({
    this.id,
    this.kupon,
    this.kuponYorum,
    this.kuponEkleyen,
    this.kuponDurum,
    this.kuponOran,
    this.kuponTarih2,
    this.canli,
    this.kuponTarih,
    this.v,
  });

  String id;
  List<KuponElement> kupon;
  String kuponYorum;
  String kuponEkleyen;
  String kuponDurum;
  double kuponOran;
  String kuponTarih2;
  bool canli;
  DateTime kuponTarih;
  int v;

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
    id: json["_id"] == null ? null : json["_id"],
    kupon: json["kupon"] == null ? null : List<KuponElement>.from(json["kupon"].map((x) => KuponElement.fromJson(x))),
    kuponYorum: json["kuponYorum"] == null ? null : json["kuponYorum"],
    kuponEkleyen: json["kuponEkleyen"] == null ? null : json["kuponEkleyen"],
    kuponDurum: json["kuponDurum"] == null ? null : json["kuponDurum"],
    kuponOran: json["kuponOran"] == null ? null : json["kuponOran"].toDouble(),
    kuponTarih2: json["kuponTarih2"] == null ? null : json["kuponTarih2"],
    canli: json["canli"] == null ? null : json["canli"],
    kuponTarih: json["kuponTarih"] == null ? null : DateTime.parse(json["kuponTarih"]),
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "kupon": kupon == null ? null : List<dynamic>.from(kupon.map((x) => x.toJson())),
    "kuponYorum": kuponYorum == null ? null : kuponYorum,
    "kuponEkleyen": kuponEkleyen == null ? null : kuponEkleyen,
    "kuponDurum": kuponDurum == null ? null : kuponDurum,
    "kuponOran": kuponOran == null ? null : kuponOran,
    "kuponTarih2": kuponTarih2 == null ? null : kuponTarih2,
    "canli": canli == null ? null : canli,
    "kuponTarih": kuponTarih == null ? null : kuponTarih.toIso8601String(),
    "__v": v == null ? null : v,
  };
}

class KuponElement {
  KuponElement({
    this.id,
    this.lig,
    this.macTarih,
    this.birinciTakim,
    this.ikinciTakim,
    this.tahmin,
    this.oran,
    this.macYorum,
    this.durum,
  });

  String id;
  String lig;
  String macTarih;
  String birinciTakim;
  String ikinciTakim;
  String tahmin;
  double oran;
  String macYorum;
  String durum;

  factory KuponElement.fromJson(Map<String, dynamic> json) => KuponElement(
    id: json["_id"] == null ? null : json["_id"],
    lig: json["lig"] == null ? null : json["lig"],
    macTarih: json["macTarih"] == null ? null : json["macTarih"],
    birinciTakim: json["birinciTakim"] == null ? null : json["birinciTakim"],
    ikinciTakim: json["ikinciTakim"] == null ? null : json["ikinciTakim"],
    tahmin: json["tahmin"] == null ? null : json["tahmin"],
    oran: json["oran"] == null ? null : json["oran"].toDouble(),
    macYorum: json["macYorum"] == null ? null : json["macYorum"],
    durum: json["durum"] == null ? "0" : json["durum"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "lig": lig == null ? null : lig,
    "macTarih": macTarih == null ? null : macTarih,
    "birinciTakim": birinciTakim == null ? null : birinciTakim,
    "ikinciTakim": ikinciTakim == null ? null : ikinciTakim,
    "tahmin": tahmin == null ? null : tahmin,
    "oran": oran == null ? null : oran,
    "macYorum": macYorum == null ? null : macYorum,
    "durum": durum == null ? null : durum,
  };
}
