import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AllTab extends StatefulWidget {
  @override
  _AllTabState createState() => _AllTabState();
}

class _AllTabState extends State<AllTab> {
  bool shotTextDetail = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            //Space
            SizedBox(
              height: 7,
            ),
            //Dear doctor..
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color:
                          Theme.of(context).primaryTextTheme.headline3.color),
                  borderRadius: BorderRadius.circular(7)),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "Selamat sore Dok , saya berumur 25 tahun . saat ini saya merasakan badan panas menggil"
                      " pegal-pegal seluruh tubuh, tengkuk leher sakit , kepala bagian atas sangat pusing."
                      "Ketika menelen sakit dan terasa panas dan perih. asam lambung naik dan perut terasa begah dan sulit BAB."
                      " Dok untuk resep obat yg cocok untuk keluhan sakit saya apa dok . terimakash,",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "medium",
                          color: Theme.of(context)
                              .accentTextTheme
                              .headline2
                              .color),
                    ),
                  ),
                  //Space
                  SizedBox(
                    height: 20,
                  ),
                  //
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Perempuan, 29 Tahun",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "medium",
                                color: Theme.of(context)
                                    .accentTextTheme
                                    .headline3
                                    .color),
                          ),
                        ),
                        Container(
                          child: Text(
                            "3 hari",
                            style: TextStyle(
                                fontSize: 11,
                                fontFamily: "medium",
                                color: Theme.of(context)
                                    .accentTextTheme
                                    .headline3
                                    .color),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //Space
            SizedBox(
              height: 18,
            ),
            //Dr. Dimitri
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/imgs/checkup.jpg"))),
                  ),
                  Expanded(
                    child: Container(
                      height: 45,
                      padding: EdgeInsets.only(left: 15, top: 0, bottom: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              "Dr. Dimitri Petrenko",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline3
                                      .color),
                            ),
                          ),
                          //star
                          Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset(
                                    "assets/icons/ic_star.png",
                                    scale: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset(
                                    "assets/icons/ic_star.png",
                                    scale: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset(
                                    "assets/icons/ic_star.png",
                                    scale: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset(
                                    "assets/icons/ic_star.png",
                                    scale: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset(
                                    "assets/icons/ic_star.png",
                                    scale: 30,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            //Space
            SizedBox(
              height: 15,
            ),
            //Dear patient...
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                children: [
                  Text(
                    "selamat sore ,keluhan yang anda alami berupa badan terasa panas kemungkinan anda mengalami demam anda bisa cek suhu badan demam dikatakan jika suhu mencapai 38 derjat atau lebih. demam umumnya terjadi karena sistem imun sedang melawan infeksi baik karena virus bakteri, jamur maupun parasit. keluhan yang anda alami bisa jadi akibat suatu infeksi baik virus mapun bakteri serta bisa pula dibarengi dengan penyakit asam lambung yang dimana untuk penangnan harus sesuai dengan penyebab yang mendasarinya. ",
                    maxLines: shotTextDetail ? 10 : 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "medium",
                        color:
                            Theme.of(context).accentTextTheme.headline3.color),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        shotTextDetail = !shotTextDetail;
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          shotTextDetail ? "Close" : "Detail",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "medium",
                              color: Theme.of(context)
                                  .accentTextTheme
                                  .headline5
                                  .color),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Space
            SizedBox(
              height: 20,
            ),
            //share and Thanks
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            "Bagi",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "medium",
                                color: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    .color),
                          ),
                        ),
                        Image.asset(
                          "assets/icons/ic_share_2.png",
                          scale: 28,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            "Suka",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "medium",
                                color: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    .color),
                          ),
                        ),
                        Image.asset(
                          "assets/icons/ic_like.png",
                          scale: 28,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Space
            SizedBox(
              height: 20,
            ),
            //Divider
            Divider(
              height: 6,
              color: Theme.of(context).primaryTextTheme.headline4.color,
              thickness: 6,
            ),
            //Space
            SizedBox(
              height: 20,
            ),

            //Dear doctor..
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color:
                          Theme.of(context).primaryTextTheme.headline3.color),
                  borderRadius: BorderRadius.circular(7)),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "halo, saya berumur 20th aku kehilangan minat akan apapun tidak merasa happy selalu murung sedih sepanjang hari, ini sudah berlangsung selama 3thun",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "medium",
                          color: Theme.of(context)
                              .accentTextTheme
                              .headline2
                              .color),
                    ),
                  ),
                  //Space
                  SizedBox(
                    height: 20,
                  ),
                  //
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Perempuan, 20 Tahun",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "medium",
                                color: Theme.of(context)
                                    .accentTextTheme
                                    .headline3
                                    .color),
                          ),
                        ),
                        Container(
                          child: Text(
                            "4 hari",
                            style: TextStyle(
                                fontSize: 11,
                                fontFamily: "medium",
                                color: Theme.of(context)
                                    .accentTextTheme
                                    .headline3
                                    .color),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //Space
            SizedBox(
              height: 18,
            ),
            //Dr. Dimitri
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/imgs/checkup.jpg"))),
                  ),
                  Expanded(
                    child: Container(
                      height: 45,
                      padding: EdgeInsets.only(left: 15, top: 0, bottom: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              "Dr. Dimitri Petrenko",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline3
                                      .color),
                            ),
                          ),
                          //star
                          Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset(
                                    "assets/icons/ic_star.png",
                                    scale: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset(
                                    "assets/icons/ic_star.png",
                                    scale: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset(
                                    "assets/icons/ic_star.png",
                                    scale: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset(
                                    "assets/icons/ic_star.png",
                                    scale: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset(
                                    "assets/icons/ic_star.png",
                                    scale: 30,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            //Space
            SizedBox(
              height: 15,
            ),
            //Dear patient...
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                children: [
                  Text(
                    "keluhan yang anda alami mengalami gangguan mood seperti merasa sedih yang mendalam, kehilangan minat memang bisa mengarah ke kondisi depersi jika dialami waktu panjang namun untuk mendiagnosa suatu penyakit tidak bisa sesimpel itu harus melakukan pemeriksaan lebih lanjut ke psikolog atau pskiater. saran saya jika anda mendapatkan kondiis sering merasa sedih sepanjang hari tanpa penyebabnya serta tidak ada minat, menganggu aktivitas anda sehari-hari anda bisa konsultaikan hal ini ke psikolog untuk mendapatkan solusi yang lebih tepat untuk membantu anda mengatasi kondisi yang anda alami.",
                    maxLines: shotTextDetail ? 4 : 10,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "medium",
                        color:
                            Theme.of(context).accentTextTheme.headline3.color),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        shotTextDetail = !shotTextDetail;
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          shotTextDetail ? "Detail" : "Close",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "medium",
                              color: Theme.of(context)
                                  .accentTextTheme
                                  .headline5
                                  .color),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Space
            SizedBox(
              height: 20,
            ),
            //share and Thanks
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            "Bagi",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "medium",
                                color: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    .color),
                          ),
                        ),
                        Image.asset(
                          "assets/icons/ic_share_2.png",
                          scale: 28,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            "Suka",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "medium",
                                color: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    .color),
                          ),
                        ),
                        Image.asset(
                          "assets/icons/ic_like.png",
                          scale: 28,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Space
            SizedBox(
              height: 20,
            ),
            //Divider
            Divider(
              height: 6,
              color: Theme.of(context).primaryTextTheme.headline4.color,
              thickness: 6,
            ),
            //Space
            SizedBox(
              height: 20,
            ),

            //Dear doctor..
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color:
                          Theme.of(context).primaryTextTheme.headline3.color),
                  borderRadius: BorderRadius.circular(7)),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "Halo dok, sya dina usia 22 tahun selama ini saya dirumah saja semenjak covid. Tapi sekarang setiap sya keluar rumah trs pulang tiba2 badan saya meriamg dan itu sering terjadi. Apa yang menyebab kan sya deman seperti itu dok. Terimakasih",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "medium",
                          color: Theme.of(context)
                              .accentTextTheme
                              .headline2
                              .color),
                    ),
                  ),
                  //Space
                  SizedBox(
                    height: 20,
                  ),
                  //
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Perempuan, 22 Tahun",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "medium",
                                color: Theme.of(context)
                                    .accentTextTheme
                                    .headline3
                                    .color),
                          ),
                        ),
                        Container(
                          child: Text(
                            "3 hari ",
                            style: TextStyle(
                                fontSize: 11,
                                fontFamily: "medium",
                                color: Theme.of(context)
                                    .accentTextTheme
                                    .headline3
                                    .color),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //Space
            SizedBox(
              height: 18,
            ),
            //Dr. Dimitri
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/imgs/checkup.jpg"))),
                  ),
                  Expanded(
                    child: Container(
                      height: 45,
                      padding: EdgeInsets.only(left: 15, top: 0, bottom: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              "Dr. Dimitri Petrenko",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "medium",
                                  color: Theme.of(context)
                                      .accentTextTheme
                                      .headline3
                                      .color),
                            ),
                          ),
                          //star
                          Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset(
                                    "assets/icons/ic_star.png",
                                    scale: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset(
                                    "assets/icons/ic_star.png",
                                    scale: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset(
                                    "assets/icons/ic_star.png",
                                    scale: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset(
                                    "assets/icons/ic_star.png",
                                    scale: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 3),
                                  child: Image.asset(
                                    "assets/icons/ic_star.png",
                                    scale: 30,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            //Space
            SizedBox(
              height: 15,
            ),
            //Dear patient...
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                children: [
                  Text(
                    "COVID-19 merupakan infeksi yang disebabkan oleh virus yang umumnya menyerang saluran pernapasan. Pada seseorang yang terinfeksi COVID-19 dapat mengalami gejala seperti demam, nyeri kepala, pegal, nyeri tenggorokan, batuk, pilek, hingga sesak napas. Keluhan tersebut berkaitan dengan tingkatan infeksi apakah tanpa gejala, gejala ringan/sedang, hingga berat",
                    maxLines: shotTextDetail ? 4 : 10,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "medium",
                        color:
                            Theme.of(context).accentTextTheme.headline3.color),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        shotTextDetail = !shotTextDetail;
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          shotTextDetail ? "Detail" : "Close",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "medium",
                              color: Theme.of(context)
                                  .accentTextTheme
                                  .headline5
                                  .color),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Space
            SizedBox(
              height: 20,
            ),
            //share and Thanks
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            "Bagi",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "medium",
                                color: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    .color),
                          ),
                        ),
                        Image.asset(
                          "assets/icons/ic_share_2.png",
                          scale: 28,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            "Suka",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "medium",
                                color: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    .color),
                          ),
                        ),
                        Image.asset(
                          "assets/icons/ic_like.png",
                          scale: 28,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Space
            SizedBox(
              height: 20,
            ),
            //Divider
            Divider(
              height: 6,
              color: Theme.of(context).primaryTextTheme.headline4.color,
              thickness: 6,
            ),
            //Space
            SizedBox(
              height: 20,
            ),

            //Dear doctor..
            // Container(
            //   width: double.infinity,
            //   margin: EdgeInsets.symmetric(
            //     horizontal: 16,
            //   ),
            //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            //   decoration: BoxDecoration(
            //       border: Border.all(
            //           width: 1,
            //           color:
            //               Theme.of(context).primaryTextTheme.headline3.color),
            //       borderRadius: BorderRadius.circular(7)),
            //   child: Column(
            //     children: [
            //       Container(
            //         child: Text(
            //           "Dear doctor, me is Dimitri, when i want to"
            //           "rush B, i just say one, two, three. Don't take the awp but just a p90?,",
            //           style: TextStyle(
            //               fontSize: 15,
            //               fontFamily: "medium",
            //               color: Theme.of(context)
            //                   .accentTextTheme
            //                   .headline2
            //                   .color),
            //         ),
            //       ),
            //       //Space
            //       SizedBox(
            //         height: 20,
            //       ),
            //       //
            //       Container(
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Container(
            //               child: Text(
            //                 "Male, 29 Years old",
            //                 style: TextStyle(
            //                     fontSize: 12,
            //                     fontFamily: "medium",
            //                     color: Theme.of(context)
            //                         .accentTextTheme
            //                         .headline3
            //                         .color),
            //               ),
            //             ),
            //             Container(
            //               child: Text(
            //                 "3 days ago",
            //                 style: TextStyle(
            //                     fontSize: 11,
            //                     fontFamily: "medium",
            //                     color: Theme.of(context)
            //                         .accentTextTheme
            //                         .headline3
            //                         .color),
            //               ),
            //             ),
            //           ],
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            // //Space
            // SizedBox(
            //   height: 18,
            // ),
            // //Dr. Dimitri
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 16),
            //   child: Row(
            //     children: [
            //       Container(
            //         width: 45,
            //         height: 45,
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(7),
            //             image: DecorationImage(
            //                 fit: BoxFit.cover,
            //                 image: AssetImage("assets/imgs/checkup.jpg"))),
            //       ),
            //       Expanded(
            //         child: Container(
            //           height: 45,
            //           padding: EdgeInsets.only(left: 15, top: 0, bottom: 2),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Container(
            //                 child: Text(
            //                   "Dr. Dimitri Petrenko",
            //                   style: TextStyle(
            //                       fontSize: 14,
            //                       fontFamily: "medium",
            //                       color: Theme.of(context)
            //                           .accentTextTheme
            //                           .headline3
            //                           .color),
            //                 ),
            //               ),
            //               //star
            //               Container(
            //                 child: Row(
            //                   children: [
            //                     Padding(
            //                       padding: const EdgeInsets.only(right: 3),
            //                       child: Image.asset(
            //                         "assets/icons/ic_star.png",
            //                         scale: 30,
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(right: 3),
            //                       child: Image.asset(
            //                         "assets/icons/ic_star.png",
            //                         scale: 30,
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(right: 3),
            //                       child: Image.asset(
            //                         "assets/icons/ic_star.png",
            //                         scale: 30,
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(right: 3),
            //                       child: Image.asset(
            //                         "assets/icons/ic_star.png",
            //                         scale: 30,
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(right: 3),
            //                       child: Image.asset(
            //                         "assets/icons/ic_star.png",
            //                         scale: 30,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               )
            //             ],
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            // //Space
            // SizedBox(
            //   height: 15,
            // ),
            // //Dear patient...
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 16),
            //   child: Wrap(
            //     children: [
            //       Text(
            //         "Dear patient Dimitri, my name is Petrenko, i play KLow, "
            //         "with same good moloko, i plant the potato, in this yacky lame, every "
            //         "one is my friend, Lorem ipsum dolor sit amet, consectetur adipiscing "
            //         "elit. Suspendisse vitae massa semper, egestas ex et, vulputate quam. "
            //         "Ut massa lorem, viverra sed sodales ac, lacinia ac dolor. ",
            //         maxLines: shotTextDetail ? 4 : 10,
            //         overflow: TextOverflow.ellipsis,
            //         style: TextStyle(
            //             fontSize: 12,
            //             fontFamily: "medium",
            //             color:
            //                 Theme.of(context).accentTextTheme.headline3.color),
            //       ),
            //       InkWell(
            //         onTap: () {
            //           setState(() {
            //             shotTextDetail = !shotTextDetail;
            //           });
            //         },
            //         child: Row(
            //           children: [
            //             Text(
            //               shotTextDetail ? "Detail" : "Close",
            //               style: TextStyle(
            //                   fontSize: 12,
            //                   fontFamily: "medium",
            //                   color: Theme.of(context)
            //                       .accentTextTheme
            //                       .headline5
            //                       .color),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // //Space
            // SizedBox(
            //   height: 20,
            // ),
            // //share and Thanks
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Container(
            //               padding: EdgeInsets.only(right: 5),
            //               child: Text(
            //                 "Bagi",
            //                 style: TextStyle(
            //                     fontSize: 14,
            //                     fontFamily: "medium",
            //                     color: Theme.of(context)
            //                         .textTheme
            //                         .headline2
            //                         .color),
            //               ),
            //             ),
            //             Image.asset(
            //               "assets/icons/ic_share_2.png",
            //               scale: 28,
            //             )
            //           ],
            //         ),
            //       ),
            //       Expanded(
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Container(
            //               padding: EdgeInsets.only(right: 5),
            //               child: Text(
            //                 "Suka",
            //                 style: TextStyle(
            //                     fontSize: 14,
            //                     fontFamily: "medium",
            //                     color: Theme.of(context)
            //                         .textTheme
            //                         .headline2
            //                         .color),
            //               ),
            //             ),
            //             Image.asset(
            //               "assets/icons/ic_like.png",
            //               scale: 28,
            //             )
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            //Space
            SizedBox(
              height: 20,
            ),
            //Divider
            Divider(
              height: 6,
              color: Theme.of(context).primaryTextTheme.headline4.color,
              thickness: 6,
            ),
            //Space
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
