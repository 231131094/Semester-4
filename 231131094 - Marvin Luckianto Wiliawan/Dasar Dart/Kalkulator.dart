
import "dart:io";
import "dart:math";

void main (){
  double angka1 = getInput("Masukkan Angka Pertama :  ");
  double angka2 = getInput("Masukkan Angka Kedua : ");
  String operasi = getOperation();

  double hasil = calculate(angka1, angka2, operasi);
  print("hasil : $hasil");

}
double getInput(String message){
    stdout.write(message);
    return double.parse(stdin.readLineSync()!);
  }

String getOperation(){
  stdout.write(""" 
    Pilih Operasi :
    1. Penjumlahan
    2. Pengurangan
    3. Perkalian
    4. Pembagian
    5. Modulus
    6. Pangkat
    7. Akar
  """);
  return stdin.readLineSync()!;
}

double calculate(double angka1 , double angka2, String operasi){
  switch (operasi) {
    case "1":
    return angka1 + angka2;
    case "2":
    return angka1 - angka2 ;
    case "3" :
    return angka1 * angka2 ;
    case "4" : 
    return angka1/angka2;
    case "5" :
    return angka1 % angka2 ;
    case "6" : 
    return pow(angka1,angka2) as double;
    case "7" :
    
    return sqrt(angka1) ;
    default: 
    print("Operasi Tidak Valid");
    return 0.0 ;
  }
}