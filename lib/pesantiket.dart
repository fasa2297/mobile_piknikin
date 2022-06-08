import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_piknikin/pilihanmuseum_seni.dart';
import 'package:mobile_piknikin/pilihanmuseum_budaya.dart';
import 'package:mobile_piknikin/pilihanmuseum_sejarah.dart';
import 'package:intl/intl.dart';

import 'contact.dart';

class PesanTiket extends StatefulWidget {
  @override
  _PesanTiket createState() => _PesanTiket();
}

class _PesanTiket extends State<PesanTiket> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  TextEditingController _controller = new TextEditingController();
  Contact newContact = new Contact(
    name: '',
    email: '',
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
      _controller.text = new DateFormat.yMd().format(result);
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

  bool isValidEmail(String input) {
    final RegExp regExp = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)$");
    return regExp.hasMatch(input);
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
      print('Email : ${newContact.email}');
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
      //appBar: AppBar(),
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
                            builder: (context) =>
                                const PilihanMuseum_sejarah()),
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
                //const Text('Pesan Tiket Museum'),
                //const Text('Harap mengisi identitas pengunjung museum'),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Masukkan nama lengkap Anda',
                      labelText: 'Pemesan'),
                  inputFormatters: [new LengthLimitingTextInputFormatter(30)],
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
                  validator: (val) => val!.isEmpty
                      ? 'Mohon cek kembali, tujuan museum harus ada'
                      : null,
                  onSaved: (val) => newContact.name = val ?? '',
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.calendar_today),
                          hintText: 'Silakan pilih tanggal kunjungan Anda',
                          labelText: 'Tanggal Kunjungan'),
                      controller: _controller,
                      validator: (val) => isValidate(val!)
                          ? null
                          : 'Mohon cek kembali tanggal kunjungan Anda',
                      onSaved: (val) =>
                          newContact.DoB = convertToDate(val ?? ''),
                    )),
                    IconButton(
                      icon: Icon(Icons.more_horiz),
                      onPressed: () {
                        _chooseDate(context, _controller.text);
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
                  validator: (val) => val!.isEmpty
                      ? 'Mohon cek kembali, no telepon Anda harus ada'
                      : null,
                  onSaved: (val) => newContact.name = val ?? '',
                ),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: 'Masukkan email Anda',
                      labelText: 'Email'),
                  inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                  validator: (val) => isValidEmail(val!)
                      ? null
                      : 'Mohon cek kembali email Anda',
                  onSaved: (val) => newContact.email = val ?? '',
                ),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.numbers),
                      hintText: 'Masukkan jumlah pesanan tiket Anda',
                      labelText: 'Jumlah Tiket'),
                  inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                  validator: (val) => val!.isEmpty
                      ? 'Mohon cek kembali, jumlah tiket pesanan harus ada'
                      : null,
                  onSaved: (val) => newContact.name = val ?? '',
                ),
                Container(
                  padding: EdgeInsets.only(left: 40, top: 20),
                  child: ElevatedButton(
                      child: Text('Pesan'), onPressed: _submitForm),
                )
              ],
            ),
          )),
    );
  }
}
