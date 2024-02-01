/*Một thư viện cần quản lý các tài liệu bao gồm Sách, Tạp chí, Báo
Mỗi tài liệu gồm có các thuộc tính sau:
Mã tài liệu(Mã tài liệu là duy nhất),Tên nhà xuất bản, số bản phát hành.
Các loại sách cần quản lý thêm các thuộc tính: tên tác giả, số trang.
Các tạp chí cần quản lý thêm: Số phát hành, tháng phát hành.
Các báo cần quản lý thêm: Ngày phát hành.
Yêu cầu 1: Xây dựng các lớp để quản lý tài liệu cho thư viện một cách hiệu quả.
Yêu cầu 2: Xây dựng lớp QuanLySach có các chức năng sau
- Thêm mới tài liêu: Sách, tạp chí, báo.
- Xoá tài liệu theo mã tài liệu.
- Hiện thị thông tin về tài liệu.
- Tìm kiếm tài liệu theo loại: Sách, tạp chí, báo.
- Thoát khỏi chương trình.*/

import 'dart:io';

class Document{
    String? id;
    String? namePublisher;
    num?  releaseNumber;

    Document({this.id, this.namePublisher, this.releaseNumber});

    void importDocument(){
      print("Nhap vao ma so: ");  this.id = stdin.readLineSync();
      print("Nhap vao ten nha phat hanh: ");  this.namePublisher = stdin.readLineSync();
      print("Nhap so ban phat hanh: "); this.releaseNumber = num.parse(stdin.readLineSync()??"0");
    }

    void printDocument(){
      print('Ma so: ${this.id}');
      print('Nha xuat ban: ${this.namePublisher}');
      print('So ban phat hanh: ${this.releaseNumber}');
    }
}

class Book extends Document{
    String? _nameCreator;
    int? _numberPage;

    Book.name(){}
    Book(String? id, String? namePublisher, num? releaseNumber, this._nameCreator, this._numberPage):super(id: id, namePublisher: namePublisher, releaseNumber: releaseNumber);

    void importDocument(){
      super.importDocument();
      print("Nhap ten tac gia: ");  this._nameCreator = stdin.readLineSync();
      print("Nhap so trang: "); this._numberPage = int.parse(stdin.readLineSync() ?? '1');
    }

    void printDocument(){
      print("----------SACH----------");
      super.printDocument();
      print('Tac gia: ${this._nameCreator}');
      print('So trang: ${this._numberPage}');
    }
}

class Magazine extends Document{
    String? _issueNumber;
    int? _issueMonth;

    Magazine.name(){}
    Magazine(String? id, String? namePublisher, num? releaseNumber, this._issueNumber, this._issueMonth):super(id:id,namePublisher: namePublisher,releaseNumber: releaseNumber);

    void importDocument(){
      super.importDocument();
      print("Nhap so phat hanh: "); this._issueNumber = stdin.readLineSync();
      print("Nhap thang phat hanh: ");  this._issueMonth = int.parse(stdin.readLineSync() ?? '1');
    }

    void printDocument(){
      print("----------TAP CHI----------");
      super.printDocument();
      print('So phat hanh: ${this._issueNumber}');
      print('Thang phat hanh: ${this._issueMonth}');
    }
}

class NewSpaper extends Document{
    int? _issueDay;

    NewSpaper.name(){}
    NewSpaper(String? id, String? namePublisher, num? releaseNumber, this._issueDay):super(id: id,namePublisher: namePublisher,releaseNumber: releaseNumber);

    void importDocument(){
      super.importDocument();
      print("Nhap ngay phat hanh: "); this._issueDay = int.parse(stdin.readLineSync()??'1');
    }

    void printDocument(){
      print("----------BAO----------");
      super.printDocument();
      print('Ngay phat hanh: ${this._issueDay}');
    }
}

class ManageBook{
  List<dynamic> list = [];

  ManageBook(){}

    void inputDocument(){
      print("Nhap loai tai lieu can them vao: ");
      String? info;
      info = stdin.readLineSync();
      print("---------------------------------------------");
      if(info == 'sach'){
        var book = Book.name();
        book.importDocument();
        list.add(book);
      }else{
        if(info == 'tap chi'){
          var magazine = Magazine.name();
          magazine.importDocument();
          list.add(magazine);
        }else{
          if(info == 'bao'){
            var newspaper = NewSpaper.name();
            newspaper.importDocument();
            list.add(newspaper);
          }else{
            print("Nhap sai ten tai lieu can nhap!");
          }
        }
      }
    }

    void outputDocument(){
      for(int i = 0; i < list.length; i++){
        list[i].printDocument();
      }
    }

    void DeleteDocument(String x){
      print("---------------------------------------------");
      for(int i = 0; i < list.length; i++){
        if(x == list[i].id){
          list.removeAt(i);
        }
      }
    }

    void searchDocument(String x){
      for(int i = 0; i < list.length; i++){
        if(list[i].runtimeType.toString() == x){
          list[i].printDocument();
        }
      }
    }
}

main(){
    var x = '''
    CHON 1 TRONG CAC CHUC NANG SAU:
    1. Them moi tai lieu: sach, tap chi, bao. (Dung dung keyword de nhap dung loai tai lieu)
    2. Xoa tai lieu theo ma tai lieu.(Nhap dung ma tai lieu de xoa)
    3. Hien thi toan bo thong tin tai lieu
    4. Tim kiem tai lieu theo loai: Book, Magazine, NewSpaper.
    5. Thoat khoi chuong trinh.
  ''';
    print(x);

    var manage = ManageBook();
    int choose;
    do{
      print("Chon chuc nang tu 1 -> 5");
      choose = int.parse(stdin.readLineSync()??'0');
      switch(choose){
        case 1:
          manage.inputDocument();
          print("---------------------------------------------");
          break;
        case 2:
          print("Nhap ma tai lieu can xoa: ");
          String x;
          x = stdin.readLineSync()!;
          manage.DeleteDocument(x);
          print("---------------------------------------------");
          break;
        case 3:
          manage.outputDocument();
          print("---------------------------------------------");
          break;
        case 4:
          print("Nhap loai tai lieu de tim kiem: Book || Magazine || NewSpaper");
          String x;
          x = stdin.readLineSync()!;
          manage.searchDocument(x);
          print("---------------------------------------------");
          break;
      }
    }while(choose < 5);
    print("Thoat khoi chuong trinh");
}