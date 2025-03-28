class Book {
  String title;
  String author;
  int pages;

  Book(this.title, this.author, this.pages);

  void info(){
    print("$title | $author | $pages");
  }
}
class DigitalBook extends Book{
  String fileSize;
  String format;
  DigitalBook(String title, String author, int pages, this.fileSize,this.format) 
  : super(title,author,pages);

  @override
  
  void info(){
    print("------------------------------------------");
    super.info();
    print("$fileSize | $format");
    print("------------------------------------------");
  }
}

class PrintedBook extends Book{
  String coverType;
  String weight;
  PrintedBook(String title, String author, int pages,this.coverType, this.weight ) 
  : super(title,author,pages);

  @override
  
  void info(){
    print("------------------------------------------");
    super.info();
    print("$coverType | $weight");
    print("------------------------------------------");
  }
}

class Library{
  List<Book> books = [];
  void addBook (Book book){
    books.add(book);
  }
  void displayAllBooks(){
    for(var book in books){
      print("Title: ${book.title}");
      print("Author: ${book.author}");
      print("Pages: ${book.pages}");
      print("-------------------------------");
    }
  }

  List<Book> searchBy(String title, String author){
    List<Book> hasilPencarian= books.where((book) => book.title.toLowerCase().contains(title.toLowerCase())|| book.author.toLowerCase().contains(author.toLowerCase())).toList();
    return hasilPencarian;
  }
    void removeBook (String title, String author){
    books.removeWhere((books) => books.title.toLowerCase() == title.toLowerCase() || books.author.toLowerCase() == author.toLowerCase());
  }
}
