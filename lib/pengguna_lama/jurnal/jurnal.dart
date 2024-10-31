import 'package:flutter/material.dart';

class JournalScreen extends StatefulWidget {
  JournalScreen({Key key}) : super(key: key);

  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
//   String statusPekerjaan ;

//   // nilai yang diterima dari API

//   bool selesai = (statusPekerjaan == 'y');
//   bool sedangDikerjakan = (statusPekerjaan == 'p');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: OrientationBuilder(
//         builder: (context, orientation) {
//           return Container(
//             padding: EdgeInsets.all(16),
//             child: ListView(
//               children: [
//                 Text(
//                   'Judul Jobdask',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 16),
//                 Row(
//                   children: [
//                     SizedBox(width: 16),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Checkbox(value: false, onChanged: null),
//                               Text('Selesai'),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Checkbox(value: true, onChanged: null),
//                               Text('Sedang dikerjakan'),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 16),
//                 Text(
//                   'Keterangan Jobdask (hanya bisa lihat)',
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla lacinia fermentum sodales. Integer pulvinar nunc ut tellus finibus iaculis. Vivamus quis quam a nisi imperdiet volutpat. Aliquam eu magna eget est iaculis feugiat.',
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 SizedBox(height: 16),
//                 Text(
//                   'Catatan Karyawan',
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 SizedBox(height: 8),
//                 TextField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     hintText: 'Masukkan catatan karyawan',
//                   ),
//                   maxLines: null,
//                 ),
//                 SizedBox(height: 16),
//                 Expanded(
//                   child: Align(
//                     alignment: Alignment.bottomCenter,
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       child: Text('Simpan'),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

  // contoh data jobdesk
  List<Map<String, dynamic>> jobdesk = [
    {
      'nama': 'Edit profil',
      'dibuat': 'admin',
      'status_pekerjaan': 'y',
      'tgl_update': '23-08-2022',
      'keterangan': 'profil harus lengkap',
      'catatan_pegawai': 'oke admin'
    }
  ];
  final _keteranganController = TextEditingController();
  String nama = 'Edit profil';
  String dibuat = 'admin';
  String setatus = 'y';
  String tgl_update = '23-08-2022';
  String keterangan =
      'profil harus lengkap jsdffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff';
  String cct = 'oke min';

  String selectedStatus;

  @override
  void initState() {
    _keteranganController.text = keterangan ?? "";
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            color: Color(0xff020438),
            padding: const EdgeInsets.only(
              top: 20,
              left: 13,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "Detail Jobdask",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              nama,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text('Dibuat oleh: ${dibuat}'),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text('Status Pekerjaan:'),
                        Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: setatus == 'y',
                                  activeColor: Colors.blue[800],
                                  onChanged: (value) {
                                    setState(() {
                                      setatus = value ? 'y' : 'p';
                                    });
                                  },
                                ),
                                Text('Selesai'),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: setatus == 'p',
                                  activeColor: Colors.blue[800],
                                  onChanged: (value) {
                                    setState(() {
                                      setatus = value ? 'p' : 'y';
                                    });
                                  },
                                ),
                                Text('Prosses'),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text('Tanggal Update: ${tgl_update}'),
                        SizedBox(height: 8),
                        TextField(
                          controller: _keteranganController,
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: 'Keterangan Jobdesk',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(16),
                          ),
                          maxLines: null,
                        ),
                        SizedBox(height: 8),
                        Text('Catatan Pegawai:'),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Masukkan catatan karyawan',
                          ),
                          maxLines: null,
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
          Padding(
            padding: const EdgeInsets.all(20),
            child: MaterialButton(
              onPressed: () async {
                // Get the image
              },
              child: Container(
                width: 328,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x44000000),
                      blurRadius: 24,
                      offset: Offset(8, 8),
                    ),
                  ],
                  color: Color(0xff020438),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Update",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
