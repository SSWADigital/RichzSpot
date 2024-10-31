import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homital/UI/YourBillingScreen.dart';
import 'package:homital/UI/pembayaran1.dart';
import 'package:homital/animation/SlideRightRoute.dart';
import 'package:homital/UI/DoctorInformationScreen.dart';
import 'package:homital/HomePageTabs/HomeScreen.dart';

class DokterTelehealth extends StatefulWidget {
  @override
  State<DokterTelehealth> createState() => _DokterTelehealthState();
}

class _DokterTelehealthState extends State<DokterTelehealth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: StaggeredGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: [
            itemWidget("assets/imgs/dc1.png", "Dr. Helena\nWijaya",
                "Dokter Umum\n2 Tahun\nRp.10.000"),
            itemWidget2("assets/imgs/d1.png", "Dr. Zackary\nIbrahim",
                "Dokter Umum\n4 Tahun\nRp.15.000"),
            itemWidget("assets/imgs/dc2.png", "Dr. Yovika\nPetrenko",
                "Dokter Umum\n4 Tahun\nRp.10.000"),
            itemWidget2("assets/imgs/dc3.png", "Dr. Damayanti\nDwi",
                "Dokter Umum\n3 Tahun\nRp.10.000"),
            itemWidget("assets/imgs/d2.png", "Dr. Handoko\nHailarious",
                "Dokter Umum\n2 Tahun\nRp.10.000"),
            itemWidget2("assets/imgs/d3.png", "Dr. Dirgantara\nHartono",
                "Dokter Umum\n4 Tahun\nRp.10.000"),
          ],
          staggeredTiles: [
            StaggeredTile.extent(1, 300),
            StaggeredTile.extent(1, 300),
            StaggeredTile.extent(1, 300),
            StaggeredTile.extent(1, 300),
            StaggeredTile.extent(1, 300),
            StaggeredTile.extent(1, 300),
          ],
        ),
      ),
    );
  }

  //note : Belumbias di buat kondisi saat dokter aktif dia di alihkan ke halaman registrasi
  Container itemWidget(String img, String title, String subTitle) {
    return Container(
        child: InkWell(
      onTap: () {
        Navigator.push(context, SlidePageRoute(page: pembayaran()));
      },
      child: new Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //img
                  Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: Container(
                      width: 100,
                      height: 120,
                      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                              fit: BoxFit.cover, image: AssetImage(img))),
                    ),
                  ),
                  //Dr. Dimitri
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: "medium",
                          color: Theme.of(context).textTheme.headline1.color),
                    ),
                  ),
                  //Dentist
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      subTitle,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "medium",
                          color: Theme.of(context)
                              .accentTextTheme
                              .headline2
                              .color),
                    ),
                  ),
                ],
              ),
            ),
            Positioned.directional(
                textDirection: Directionality.of(context),
                end: -1,
                top: -21,
                child: Container(
                  width: 65,
                  height: 70,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/icons/ic_bg.png"))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/ic_star.png",
                        scale: 38,
                        color: Theme.of(context).textTheme.subtitle2.color,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 3, right: 7),
                        child: Text(
                          "4.5",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: "medium",
                              color:
                                  Theme.of(context).textTheme.subtitle2.color),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    ));
  }

//alternatif demo
  Container itemWidget2(String img1, String title1, String subTitle1) {
    return Container(
        child: InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        Navigator.push(context, SlidePageRoute(page: pembayaran()));
      },
      child: new Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //img
                  Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: Container(
                      width: 100,
                      height: 120,
                      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                              fit: BoxFit.cover, image: AssetImage(img1))),
                    ),
                  ),
                  //Dr. Dimitri
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      title1,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: "medium",
                          color: Theme.of(context).textTheme.headline1.color),
                    ),
                  ),
                  //Dentist
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      subTitle1,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "medium",
                          color: Theme.of(context)
                              .accentTextTheme
                              .headline2
                              .color),
                    ),
                  ),
                ],
              ),
            ),
            Positioned.directional(
                textDirection: Directionality.of(context),
                end: -1,
                top: -21,
                child: Container(
                  width: 65,
                  height: 70,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/icons/ic_bg.png"))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/ic_star.png",
                        scale: 38,
                        color: Theme.of(context).textTheme.subtitle2.color,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 3, right: 7),
                        child: Text(
                          "4.5",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: "medium",
                              color:
                                  Theme.of(context).textTheme.subtitle2.color),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
