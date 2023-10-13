import 'package:flutter/material.dart';

class ProdukDetail extends StatefulWidget {
  final String? kodeProduk;
  final String? namaProduk;
  final int? harga;

  const ProdukDetail({
    Key? key,
    this.kodeProduk,
    this.namaProduk,
    this.harga
  }) : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        backgroundColor: Colors.indigo.shade700,
        foregroundColor: Colors.white
      ),
      body: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(top: 20),
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              _showKodeProduk(),
              _showNamaProduk(),
              _showHargaProduk()
            ]
            .map((widget) => Padding(
                padding: const EdgeInsets.only(left: 30),
                child: widget
              )).toList()
            )
          )
      );
    }


  _showKodeProduk() {
    return Text.rich(
      TextSpan(
        text: "Kode Produk : ",
        children: <TextSpan>[
          TextSpan(
            text: widget.kodeProduk.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.deepPurple.shade900)
          )
        ]
      )
    );
  }

  _showNamaProduk() {
    return Text.rich(
      TextSpan(
        text: "Nama Produk : ",
        children: <TextSpan>[
          TextSpan(
            text: widget.namaProduk,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.deepPurple.shade900)
          )
        ]
      )
    );
  }
  
  _showHargaProduk() {
    return Text.rich(
      TextSpan(
        text: "Harga : ",
        children: <TextSpan>[
          TextSpan(
            text: widget.harga.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.deepPurple.shade900)
          )
        ]
      )
    );
  }
}