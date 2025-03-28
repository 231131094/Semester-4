const double hargaTiket = 50000.00;
enum method {tunai, qris, transfer}
void main () async{
  try{
    bool isPaid = await bookingTiket(60000.00,method.transfer);
    await konfirmasiPembayaran(bayar : isPaid);
    await cetakTiket(bayarValid : isPaid);
    await orderSnack(adaPesanan:  true, pesanan: "cola");
  } catch (e){
    print(e);
  } finally {
    print("terima kasih telah menggunaan aplikasi e-ticket \n");
  }
}


Future<bool> bookingTiket(dynamic duit,dynamic methodBayar)async{
  double total = hargaTiket;
  bool _bookingStatus = false;
  if (duit is double || duit is int){
    _bookingStatus = await Future.delayed(Duration(seconds : 1),(){
      switch (methodBayar){
        case (method.qris):
        total += total * 0.05;
        case (method.transfer):
        total += total * 0.08;
      }
      if(duit == total){
        print("Pembayaran Berhasil, uang kembalian : 0");
        return _bookingStatus = true;
      }else if (duit > total){
        double kembali= duit-total;
        print("Pembayaran Berhasil, Kembalian : ${kembali}");
        return true;
      }else {
        print("Maaf,Pembayaran Gagal");
        return false ;
      }
    });
  }else {
    throw Exception("Maaf, Nominal pembayaran harus berupa angka ");
  }
  return _bookingStatus;
}

Future<void> konfirmasiPembayaran({required bool bayar})async{
  bool _telahBayar = await Future.delayed(Duration(seconds : 3),()=>bayar) ;

  if (!_telahBayar){
    throw Exception("Maaf, pembayaran anda belum kami terima");
  }

  print("Pembayaran Berhasil");
}

cetakTiket({required bool bayarValid}){
  if(bayarValid){
    print("Selamat, tiket Berhasil dicetak");
  }else{
    print("Maaf, pembayaran anda belum kami terima");
  }
}

orderSnack ({required bool adaPesanan,String?pesanan}){
  if(adaPesanan&& pesanan == "cola"){
      print("Anda memesan ${pesanan} dan harganya sebesar Rp.10000,00");
  }else if (adaPesanan && pesanan == "popcorn"){
    print("Anda memesan ${pesanan} dan harganya sebesar Rp. 25000,00");
  }else{
    print("Anda tidak memesan snack apapun");
  }
}

