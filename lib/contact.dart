class Contact {
  String name;
  String museum;
  DateTime? DoB;
  String email;
  String notelp;
  String jum_tiket;
  String tot_hrg;

  Contact({
    required this.name,
    required this.museum,
    this.DoB,
    required this.email,
    required this.notelp,
    required this.jum_tiket,
    required this.tot_hrg,
  });
}
