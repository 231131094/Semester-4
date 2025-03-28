import 'dart:io';

List <int> daftarAngka = [];

void main () {
  while (true){
  int bilangan = getInput("Masukkan Bilangan (tekan Enter untuk selesai) : ");
  print(daftarAngka);
  if (bilangan == Null){
    hitungRataRata(daftarAngka);
    continue; 
  }
  daftarAngka.add(bilangan);
  }
}

int getInput(String message){
    stdout.write(message);
    return int.parse(stdin.readLineSync()!);
}

double hitungRataRata (List<int> daftarAngka ){
  int hasil = daftarAngka.reduce((a,b) => a+b);
 return hasil / daftarAngka.length ;
}