/*Các thí sinh dự thi đại học bao gồm các thí sinh thi khối A, B, và khối C.
Các thí sinh cần quản lý các thông tin sau: Số báo danh, họ tên, địa chỉ, mức ưu tiên.
Thí sinh thi khối A thi các môn: Toán, Lý, Hoá.
Thí sinh thi khối B thi các môn: Toán, Hoá, Sinh.
Thí sinh thi khối C thi các môn: Văn, Sử, Địa.
Yêu cầu 1: Xây dựng các lớp để quản lý các thi sinh dự thi đại học.
Yêu cầu 2: Xây dựng lớp TuyenSinh có các chức năng:
Thêm mới thí sinh.
Hiện thị thông tin của thí sinh và khối thi của thí sinh.
Tìm kiếm theo số báo danh.
Thoát khỏi chương trình.*/

import 'dart:io';

enum Candidate{
  BlockA,
  BlockB,
  BlockC
}

class Candidates{
    int? id;
    String? name;
    String? add;
    String? levelPriority;

    Candidates({this.id,this.name,this.add,this.levelPriority});

    void importCandidates(){
      print("Nhap ma so thi sinh: ");
      this.id = int.parse(stdin.readLineSync()??'0');
      print("Nhap ten thi sinh: ");
      this.name = stdin.readLineSync();
      print("Nhap dia chi thi sinh: ");
      this.add = stdin.readLineSync();
      print("Nhap muc do uu tien: ");
      this.levelPriority = stdin.readLineSync();
    }

    void printCandidates(){
      print('Ma so: ${this.id}');
      print('Ten thi sinh: ${this.name}');
      print('Dia chi: ${this.add}');
      print('Muc uu tien: ${this.levelPriority}');
    }
}

class BlockA extends Candidates{
    num? math;
    num? physics;
    num? chemistry;
    Candidate type = Candidate.BlockA;
    
    BlockA.name(){}
    BlockA(int? id, String? name, String? add, String? levelPriority, this.math, this.physics, this.chemistry):super(id: id,name: name,add: add,levelPriority: levelPriority);
    
    @override
    void importCandidates() {
      super.importCandidates();
      print("Nhap diem mon Toan: ");  this.math = num.parse(stdin.readLineSync()??'0');
      print("Nhap diem mon Ly: ");  this.physics = num.parse(stdin.readLineSync()??'0');
      print("Nhap diem mon Hoa: ");  this.chemistry = num.parse(stdin.readLineSync()??'0');
    }

    @override
    void printCandidates(){
      super.printCandidates();
      print('Toan: ${this.math}');
      print('Ly: ${this.physics}');
      print('Hoa: ${this.chemistry}');
    }
}

class BlockB extends Candidates{
    num? math;
    num? chemistry;
    num? biology;
    Candidate type = Candidate.BlockB;

    BlockB(int? id, String? name, String? add, String? levelPriority, this.math, this.chemistry,this.biology):super(id: id,name: name,add: add,levelPriority: levelPriority);
    BlockB.name(){}

    @override
    void importCandidates() {
      super.importCandidates();
      print("Nhap diem mon Toan: ");  this.math = num.parse(stdin.readLineSync()??'0');
      print("Nhap diem mon Hoa: ");  this.chemistry = num.parse(stdin.readLineSync()??'0');
      print("Nhap diem mon Sinh: ");  this.biology = num.parse(stdin.readLineSync()??'0');
    }

    @override
    void printCandidates(){
      super.printCandidates();
      print('Toan: ${this.math}');
      print('Hoa: ${this.chemistry}');
      print('Sinh: ${this.biology}');
    }
}

class BlockC extends Candidates{
    num? literature;
    num? history;
    num? geography;
    Candidate type = Candidate.BlockC;

    BlockC(int? id, String? name, String? add, String? levelPriority, this.literature, this.history, this.geography):super(id: id,name: name,add: add,levelPriority: levelPriority);
    BlockC.name(){}

    @override
    void importCandidates() {
      super.importCandidates();
      print("Nhap diem mon Van: ");  this.literature = num.parse(stdin.readLineSync()??'0');
      print("Nhap diem mon Lich Su: ");  this.history = num.parse(stdin.readLineSync()??'0');
      print("Nhap diem mon Dia Li: ");  this.geography = num.parse(stdin.readLineSync()??'0');
    }

    @override
    void printCandidates(){
      super.printCandidates();
      print('Van Hoc: ${this.literature}');
      print('Lich Su: ${this.history}');
      print('Dia Li: ${this.geography}');
    }
}

class Admissions{
    List<dynamic>data = [];

    Admissions(){}

    void inputCandidates(){
      String? info;
      print("Nhap khoi thi sinh can them vao(A,B,C): ");
      info = stdin.readLineSync();
      if(info == 'A'){
        var a = BlockA.name();
        a.importCandidates();
        data.add(a);
      }else{
        if(info == 'B'){
          var b = BlockB.name();
          b.importCandidates();
          data.add(b);
        }else{
          if(info == 'C'){
            var c = BlockC.name();
            c.importCandidates();
            data.add(c);
          }else{
            print("Xin moi nhap lai!");
          }
        }
      }
    }

    void outputCandidates(){
      for(int i = 0; i < data.length; i++){
        if(data[i].type == Candidate.BlockA){
          print("---------KHOI A----------");
          data[i].printCandidates();
        }else{
          if(data[i].type == Candidate.BlockB){
            print("---------KHOI B----------");
            data[i].printCandidates();
          }else{
            if(data[i].type == Candidate.BlockC){
              print("---------KHOI C----------");
              data[i].printCandidates();
            }
          }
        }
      }
    }

    void searchCandidates(int n){
        for(int i = 0; i < data.length; i++){
          if(data[i].id == n){
            data[i].printCandidates();
          }
        }
    }
}

main(){
    var x = '''
    CHỌN 1 TRONG CÁC LỰA CHỌN SAU (chon 1 -> 4)
    1. Thêm mới thí sinh.
    2. Hiện thị thông tin của thí sinh và khối thi của thí sinh.
    3. Tìm kiếm theo số báo danh.
    4. Thoát khỏi chương trình
''';
    print(x);
    int? choose;
    var admin = Admissions();
    do{
      print("Nhap vao lua chon cua ban: "); choose = int.parse(stdin.readLineSync()??'1');
      switch(choose){
        case 1:
          print("--------------------------------------------");
          admin.inputCandidates();
          break;
        case 2:
          print("--------------------------------------------");
          admin.outputCandidates();
        case 3:
          print("--------------------------------------------");
          print("Nhap ma so sinh vien: ");
          int? n;
          n = int.parse(stdin.readLineSync()??'1');
          admin.searchCandidates(n);
          break;
      }
    }while(choose < 4);
    print("Thoat khoi chuong trinh");
}