import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReadPerizinanSekertaris extends StatefulWidget {
  const ReadPerizinanSekertaris({super.key});

  @override
  State<ReadPerizinanSekertaris> createState() => _ReadPerizinanSekertarisState();
}

class _ReadPerizinanSekertarisState extends State<ReadPerizinanSekertaris> {
  @override
  void initState(){
    super.initState();
    Future.microtask(()=> Provider.of<>)
  }

  Widget cardPerizinan(String nama, String keterangan, String waktu,
      String jenis, BuildContext context) {
    return Container(
      height: 150,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color.fromRGBO(172, 172, 172, 1), width: 0.7),
          bottom:
              BorderSide(color: Color.fromRGBO(172, 172, 172, 1), width: 0.7),
        ),
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.only(left: 25, right: 25),
            title: Text(
              nama,
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              '$keterangan\n$waktu',
              style: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.w400),
            ),
            trailing: Text(
              jenis,
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.delete, color: Colors.white, size: 15),
                      const SizedBox(width: 5),
                      Text(
                        "Delete",
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(55, 163, 165, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context, '/updatePerizinanSekertaris'
                      
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.update,
                        color: Colors.white,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "Update",
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Perizinan",
          style: GoogleFonts.poppins(
              color: const Color.fromRGBO(6, 215, 115, 1),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          cardPerizinan('Agus', 'Pernikahan agus dan siti', '10 Des 2020',
              'Pernikahan', context),
          cardPerizinan('Agus', 'Pernikahan agus dan siti', '10 Des 2020',
              'Pernikahan', context),
        ],
      ),
      bottomSheet: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: const Color.fromRGBO(6, 215, 115, 1),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/createPerizinanSekertaris');
          },
          child: const Center(
            child: Text(
              'Tambah Perizinan',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
