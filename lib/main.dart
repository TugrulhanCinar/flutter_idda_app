import 'package:flutter/material.dart';
import 'package:flutteriddaapp/locator.dart';
import 'package:flutteriddaapp/view_models/kupon_view_model.dart';
import 'package:provider/provider.dart';
import 'helper.dart';
import 'pages/home_page.dart';

//todo: logoları ekle
//todo: splashScreen ekle
//todo: reklam mantığını hallet
//todo: bizi yorumla


/*
  canlı ve tekli sayfa geçişi reklamı göster
  kupoon: ödüllü reklam koy
  sayfa geçişi: maks:3
  ödülü: Hepsini görsün
 */
void main() {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final anaRenk = Color.fromRGBO(35, 66, 86,1);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<KuponViewModel>(create: (_) => KuponViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Helper.anaRenk1,
          appBarTheme: AppBarTheme(
              color: Helper.anaRenk,
            centerTitle: true
          ),
          textTheme: Theme.of(context).textTheme.copyWith(

            bodyText1: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontStyle: FontStyle.italic

            ),
          ),
        ),
      ),
    );
  }
}
