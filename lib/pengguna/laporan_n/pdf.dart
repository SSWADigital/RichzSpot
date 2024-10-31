import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

class SalaryReport extends StatefulWidget {
  @override
  _SalaryReportState createState() => _SalaryReportState();
}

class _SalaryReportState extends State<SalaryReport> {
  DateTime _selectedDate;
  bool _isPDFGenerated = false;
  String _pdfPath = '';
  List employeeData = [
    {
      'name': 'John Doe',
      'jabatan': 'Programer',
      'gaji_pokok': '5000',
      'transportasi': '5000',
      'bonus': '5000',
      'potongan': '120',
    }
  ];

  List<Map<String, dynamic>> employeeDatagaji = [
    {'name': 'John Doe', 'salary': 5000},
    {'name': 'Jane Smith', 'salary': 6000},
    {'name': 'Bob Johnson', 'salary': 4500},
    {'name': 'Emily Davis', 'salary': 7000},
  ];

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  Future<void> _generatePDF4() async {
    final pdf = pw.Document();
    final logoImage =
        (await rootBundle.load('assets/icons/swa1.png')).buffer.asUint8List();
    final signatureImage =
        (await rootBundle.load('assets/icons/swa1.png')).buffer.asUint8List();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(32),
        build: (context) => [
          pw.Center(
            child: pw.Image(pw.MemoryImage(logoImage)),
          ),
          pw.SizedBox(height: 24),
          pw.Header(
            level: 0,
            child: pw.Text(
              'Laporan Gaji Karyawan',
              style: pw.TextStyle(
                fontSize: 20,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
          pw.SizedBox(height: 12),
          pw.Text(
            'Bulan: ${DateFormat.yMMM().format(_selectedDate)}',
            style: pw.TextStyle(
              fontSize: 16,
            ),
          ),
          pw.SizedBox(height: 24),
          pw.Text(
            'Nama: ${employeeData[0]['name']}',
            style: pw.TextStyle(
              fontSize: 16,
            ),
          ),
          pw.Text(
            'Jabatan: ${employeeData[0]['jabatan']}',
            style: pw.TextStyle(
              fontSize: 16,
            ),
          ),
          pw.Text(
            'Gaji Pokok: ${employeeData[0]['gaji_pokok']}',
            style: pw.TextStyle(
              fontSize: 16,
            ),
          ),
          pw.Text(
            'Transportasi: ${employeeData[0]['transportasi']}',
            style: pw.TextStyle(
              fontSize: 16,
            ),
          ),
          pw.Text(
            'Bonus: ${employeeData[0]['bonus']}',
            style: pw.TextStyle(
              fontSize: 16,
            ),
          ),
          pw.Text(
            'Potongan: ${employeeData[0]['potongan']}',
            style: pw.TextStyle(
              fontSize: 16,
            ),
          ),
          pw.SizedBox(height: 24),
          // pw.Center(
          //   child: pw.Image(pw.MemoryImage(signatureImage)),
          // ),
          // pw.SizedBox(height: 12),
          // pw.Text(
          //   'Nama Manager',
          //   style: pw.TextStyle(
          //     fontSize: 16,
          //   ),
          // ),
          pw.Stack(
            children: [
              pw.Positioned(
                left: 0,
                top: 150,
                child: pw.Image(pw.MemoryImage(
                    signatureImage)), //(pw.MemoryImage(signatureImage)
              ),
              pw.Positioned(
                left: 0,
                top: 300,
                child: pw.Text(
                  'Nama Manager',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final fileName =
        'laporan_gaji_${DateFormat.yMMM().format(_selectedDate)}.pdf';
    final file = File('${directory.path}/$fileName');
    await file.writeAsBytes(await pdf.save());

    setState(() {
      _isPDFGenerated = true;
      _pdfPath = file.path;
    });
  }

  Future<void> _generatePDF3() async {
    final pdf = pw.Document();
    final logoImage =
        (await rootBundle.load('assets/icons/swa1.png')).buffer.asUint8List();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(32),
        build: (context) => [
          pw.Center(
            child: pw.Image(pw.MemoryImage(logoImage)),
          ),
          pw.SizedBox(height: 24),
          pw.Header(
            level: 0,
            child: pw.Text(
              'Laporan Gaji Karyawan',
              style: pw.TextStyle(
                fontSize: 20,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
          pw.SizedBox(height: 12),
          pw.Text(
            'Bulan: ${DateFormat.yMMM().format(_selectedDate)}',
            style: pw.TextStyle(
              fontSize: 16,
            ),
          ),
          pw.SizedBox(height: 24),
          for (var employee in employeeData)
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'Nama: ${employee['name']}',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.Text(
                  'Jabatan: ${employee['jabatan']}',
                ),
                pw.SizedBox(height: 8),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Gaji Pokok'),
                    pw.Text(
                      employee['gaji_pokok'].toString(),
                    ),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Transportasi'),
                    pw.Text(
                      employee['transportasi'].toString(),
                    ),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Bonus'),
                    pw.Text(
                      employee['bonus'].toString(),
                    ),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Potongan'),
                    pw.Text(
                      employee['potongan'].toString(),
                    ),
                  ],
                ),
                pw.SizedBox(height: 16),
              ],
            ),
          pw.SizedBox(height: 24),
          pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('Jakarta, ${DateFormat.yMd().format(DateTime.now())}'),
              pw.Text('Mengetahui,'),
            ],
          ),
          pw.SizedBox(height: 30),
          pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Image(
                pw.MemoryImage(
                  logoImage,
                ),
                width: 100,
              ),
              pw.Text('Nama Manager'),
            ],
          ),
        ],
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final fileName =
        'laporan_gaji_${DateFormat.yMMM().format(_selectedDate)}.pdf';
    final file = File('${directory.path}/$fileName');
    await file.writeAsBytes(await pdf.save());

    setState(() {
      _isPDFGenerated = true;
      _pdfPath = file.path;
    });
    await OpenFile.open(_pdfPath);
  }

  Future<void> _generatePDF2() async {
    final pdf = pw.Document();
    final logoImage =
        (await rootBundle.load('assets/icons/swa1.png')).buffer.asUint8List();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(32),
        build: (context) => [
          pw.Center(
            child: pw.Image(pw.MemoryImage(logoImage)),
          ),
          pw.SizedBox(height: 24),
          pw.Header(
            level: 0,
            child: pw.Text(
              'Laporan Gaji Karyawan',
              style: pw.TextStyle(
                fontSize: 20,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
          pw.SizedBox(height: 12),
          pw.Text(
            'Bulan: ${DateFormat.yMMM().format(_selectedDate)}',
            style: pw.TextStyle(
              fontSize: 16,
            ),
          ),
          pw.SizedBox(height: 24),
          pw.Table.fromTextArray(
            headers: [
              'Nama',
              'Jabatan',
              'Gaji Pokok',
              'Transportasi',
              'Bonus',
              'Potongan',
              'Gaji'
            ],
            data: employeeDatagaji
                .map((e) => [
                      e['name'],
                      e['jabatan'],
                      e['gaji_pokok'],
                      e['transportasi'],
                      e['bonus'],
                      e['potongan'],
                      (int.parse(e['gaji_pokok']) +
                              int.parse(e['transportasi']) +
                              int.parse(e['bonus']) -
                              int.parse(e['potongan']))
                          .toString()
                    ])
                .toList(),
          ),
        ],
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final fileName =
        'laporan_gaji_${DateFormat.yMMM().format(_selectedDate)}.pdf';
    final file = File('${directory.path}/$fileName');
    await file.writeAsBytes(await pdf.save());

    setState(() {
      _isPDFGenerated = true;
      _pdfPath = file.path;
    });
  }

  Future<void> _generatePDF() async {
    final pdf = pw.Document();
    final logoImage =
        (await rootBundle.load('assets/icons/swa1.png')).buffer.asUint8List();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(32),
        build: (context) => [
          pw.Center(
            child: pw.Image(pw.MemoryImage(logoImage)),
          ),
          pw.SizedBox(height: 24),
          pw.Header(
            level: 0,
            child: pw.Text(
              'Laporan Gaji Karyawan',
              style: pw.TextStyle(
                fontSize: 20,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
          pw.SizedBox(height: 12),
          pw.Text(
            'Bulan: ${DateFormat.yMMM().format(_selectedDate)}',
            style: pw.TextStyle(
              fontSize: 16,
            ),
          ),
          pw.SizedBox(height: 24),
          pw.Table.fromTextArray(
            headers: ['Nama', 'Gaji'],
            data: employeeData
                .map((e) => [e['name'], e['salary'].toString()])
                .toList(),
          ),
        ],
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final fileName =
        'laporan_gaji_${DateFormat.yMMM().format(_selectedDate)}.pdf';
    final file = File('${directory.path}/$fileName');
    await file.writeAsBytes(await pdf.save());

    setState(() {
      _isPDFGenerated = true;
      _pdfPath = file.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan Gaji'),
        actions: [
          if (_isPDFGenerated)
            IconButton(
              onPressed: () async {
                await OpenFile.open(_pdfPath);
              },
              icon: Icon(Icons.download),
            ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih Bulan:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: _selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      ).then((date) {
                        if (date != null) {
                          setState(() {
                            _selectedDate = date;
                            _isPDFGenerated = false;
                          });
                        }
                      });
                    },
                    child: Text(DateFormat.yMMM().format(_selectedDate)),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _generatePDF3,
                  child: Text('Buat Laporan'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    await OpenFile.open(_pdfPath);
                  },
                  child: Text('unduh'),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (_isPDFGenerated)
              Expanded(
                child: Center(
                  child: Text(
                    'PDF berhasil dibuat. Silahkan unduh file PDF!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            if (!_isPDFGenerated)
              Expanded(
                child: Center(
                  child: Text(
                    'Belum ada laporan untuk bulan ini.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
