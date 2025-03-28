import "perpustakaan.dart";
import 'dart:io';
void main(){
  Library myLibrary = Library();

  Book book1 = Book("Dasar Dart", "SJP", 180);
  Book book2 = Book("Flutter Dasar", "Ricky", 201);
  Book book3 = Book("Same Dream Again", "Sumino Yoru", 230);
  Book book4 = Book("Hujan", "TereLiye", 184);
  Book book5 = Book("Crypto", "Academy Crypto", 300);
  Book book6 = Book("Apapun", "Siapapun", 190);
  DigitalBook book7 = DigitalBook("Minna No Nihongo", "Bu zhi dao", 250, "2 MB", "PDF");
  PrintedBook book8 = PrintedBook("Nanda Nanda", "Wakanai", 185, "softCover", "125g");

  myLibrary.addBook(book1);
  myLibrary.addBook(book2);
  myLibrary.addBook(book3);
  myLibrary.addBook(book4);
  myLibrary.addBook(book5);
  myLibrary.addBook(book6);
  myLibrary.addBook(book7);
  myLibrary.addBook(book8);

  print("All Digital Book in Library :");
  book7.info();
  book8.info();

  print("All Books In Library :");
  myLibrary.displayAllBooks();

  stdout.write("\nSearch Book by Title/Author : ");
  dynamic hasilSearch = stdin.readLineSync();
  List<Book> searchResults = myLibrary.searchBy(hasilSearch, hasilSearch);
  for (var result in searchResults){
    print("Title : ${result.title}, Author : ${result.author}");
  }
  
  stdout.write("\nRemove Book by Title/Author : ");
  dynamic hasilRemove = stdin.readLineSync();
  myLibrary.removeBook(hasilRemove,hasilRemove);

  print("Updated List of Books in Library After Deleted: ");
  myLibrary.displayAllBooks();
  
}