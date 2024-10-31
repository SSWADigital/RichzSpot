import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyTable extends StatefulWidget {
  const MyTable({Key key}) : super(key: key);

  @override
  _MyTableState createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  List<dynamic> data = [];

  Future<void> fetchData() async {
    final response = await http.post(
        Uri.parse("http://103.157.97.200/api_absen_qr/histori_absen.php"),
        body: {"pegawai_id": "000051", "aksi": "2"});
    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Table(
          border: TableBorder.all(
            color: Colors.black,
            width: 1.0,
            style: BorderStyle.solid,
          ),
          children: [
            TableRow(
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              children: [
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Column 1',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Column 2',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Column 3',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ...data.map((item) {
              return TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(item['column1'].toString()),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(item['column2'].toString()),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(item['column3'].toString()),
                    ),
                  ),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
