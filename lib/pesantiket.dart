// Nama : Anindika Riska Intan Fauzy
// NIM  : 1301194254

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_piknikin/katagorimuseum.dart';
import 'package:mobile_piknikin/navigationbar.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'contact.dart';

class PesanTiket extends StatefulWidget {
  @override
  _PesanTiket createState() => _PesanTiket();
}

class _PesanTiket extends State<PesanTiket> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  TextEditingController _namecontroller = new TextEditingController();
  TextEditingController _museumcontroller = new TextEditingController();
  TextEditingController _tanggalcontroller = new TextEditingController();
  TextEditingController _notelpcontroller = new TextEditingController();
  TextEditingController _jumTiketcontroller = new TextEditingController();
  TextEditingController _totHrgcontroller = new TextEditingController();

  final String url = 'http://127.0.0.1:8000/api/store';

  Future sendTikets() async {
    var response = await http.post(Uri.parse(url));
    //print(json.decode(response.body));
    return json.decode(response.body);
  }

  Contact newContact = new Contact(
    name: '',
    museum: '',
    notelp: '',
    jum_tiket: '',
    tot_hrg: '',
  );

  Future<Null> _chooseDate(
      BuildContext context, String initalDateString) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initalDateString) ?? now;
    initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now)
        ? initialDate
        : now);
    var result = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: new DateTime(2000),
        lastDate: new DateTime.now());

    if (result == null) return;
    setState(() {
      _tanggalcontroller.text = new DateFormat.yMd().format(result);
    });
  }

  bool isValidate(String dob) {
    if (dob.isEmpty) return true;
    var d = convertToDate(dob);
    return d != null && d.isBefore(new DateTime.now());
  }

  DateTime? convertToDate(String input) {
    try {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }
  }

  showMessege(String messege, [MaterialColor color = Colors.red]) {
    scaffoldKey.currentState!.showSnackBar(new SnackBar(
      content: Text(messege),
      backgroundColor: color,
    ));
  }

  _submitForm() {
    final FormState? form = formKey.currentState;
    if (!form!.validate()) {
      showMessege('Mohon Cek Kembali Pesanan Anda');
    } else {
      form.save();
      print('Pesan Tiket Anda Telah Berhasil');
      print('Nama : ${newContact.name}');
      print('Museum : ${newContact.museum}');
      print('Tanggal : ${newContact.DoB}');
      print('NoTelp : ${newContact.notelp}');
      print('JumlahTiket : ${newContact.jum_tiket}');
      print('TotalHarga : ${newContact.tot_hrg}');
      print('================================================');
      print('Memesan tiket...');
    }
  }

  _backPage() {
    //mengembalikan ke page detail museum
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
          bottom: false,
          top: false,
          child: Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: <Widget>[
                Container(
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    alignment: Alignment.topLeft,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Navbarr()),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                  child: Text(
                    'Pesan Tiket Museum',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: Text(
                    'Harap mengisi identitas pengunjung museum',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Masukkan nama lengkap Anda',
                      labelText: 'Pemesan'),
                  inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                  controller: _namecontroller,
                  validator: (val) => val!.isEmpty
                      ? 'Mohon cek kembali, nama pemesan harus ada'
                      : null,
                  onSaved: (val) => newContact.name = val ?? '',
                ),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.museum),
                      hintText: 'Masukkan nama museum kunjungan Anda',
                      labelText: 'Museum'),
                  inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                  controller: _museumcontroller,
                  validator: (val) => val!.isEmpty
                      ? 'Mohon cek kembali, tujuan museum harus ada'
                      : null,
                  onSaved: (val) => newContact.museum = val ?? '',
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.calendar_today),
                          hintText: 'Silakan pilih tanggal kunjungan Anda',
                          labelText: 'Tanggal Kunjungan'),
                      controller: _tanggalcontroller,
                      validator: (val) => isValidate(val!)
                          ? null
                          : 'Mohon cek kembali tanggal kunjungan Anda',
                      onSaved: (val) =>
                          newContact.DoB = convertToDate(val ?? ''),
                    )), //
                    IconButton(
                      icon: Icon(Icons.more_horiz),
                      onPressed: () {
                        _chooseDate(context, _tanggalcontroller.text);
                      },
                    )
                  ],
                ),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.phone),
                      hintText: 'Masukkan nomor telepon Anda',
                      labelText: 'No Telepon'),
                  inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                  controller: _notelpcontroller,
                  validator: (val) => val!.isEmpty
                      ? 'Mohon cek kembali, no telepon Anda harus ada'
                      : null,
                  onSaved: (val) => newContact.notelp = val ?? '',
                ),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.numbers),
                      hintText: 'Masukkan jumlah pesanan tiket Anda',
                      labelText: 'Jumlah Tiket'),
                  inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                  controller: _jumTiketcontroller,
                  validator: (val) => val!.isEmpty
                      ? 'Mohon cek kembali, jumlah tiket pesanan harus ada'
                      : null,
                  onSaved: (val) => newContact.jum_tiket = val ?? '',
                ),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.numbers),
                      hintText: 'Masukkan total harga tiket Anda',
                      labelText: 'Total Harga Tiket'),
                  inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                  controller: _totHrgcontroller,
                  validator: (val) => val!.isEmpty
                      ? 'Mohon cek kembali, total harga tiket pesanan harus ada'
                      : null,
                  onSaved: (val) => newContact.tot_hrg = val ?? '',
                ),
                Container(
                  padding: EdgeInsets.only(left: 40, top: 20),
                  child: ElevatedButton(
                    child: Text('Pesan'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PesanTiket()),
                      );
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
