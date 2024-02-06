// ignore_for_file: unnecessary_null_comparison

/*Thư viện trung tâm đại học quốc gia có nhu cầu quản lý việc mượn, trả sách.
Sinh viên đăng ký tham gia mượn sách thông qua thẻ mà thư viện cung cấp.
Với mỗi thẻ sẽ lưu các thông tin sau: Mã phiếu mượn, ngày mượn, hạn trả, số hiệu sách,
và các thông tin cá nhân của sinh viên mượn sách. Các thông tin của sinh viên mượn sách bao gồm: Họ tên, tuổi, lớp.
Để đơn giản cho ứng dụng console. Chúng ta mặc định ngày mượn, ngày trả là số nguyên dương.
Yêu cầu 1: Xây dựng lớp SinhVien để quản lý thông tin của mỗi sinh viên.
Yêu cầu 2: Xây dựng lớp TheMuon để quản lý việc mượn trả sách của các sinh viên.
Yêu cầu 3: Xây dựng các phương thức: Thêm, xoá theo mã phiếu mượn và hiển thị thông tin các thẻ mượn.*/

import 'dart:io';

class Student {
  String? name;
  int? old;
  String? grade;

  Student.init() {}

  void import() {
    print("Nhap ten hs: ");
    this.name = stdin.readLineSync();
    print("Nhap tuoi hs: ");
    this.old = int.parse(stdin.readLineSync() ?? '0');
    print("Nhap lop hs: ");
    this.grade = stdin.readLineSync();
  }

  void output() {
    print('Ten hs: ${this.name}');
    print('Tuoi hs: ${this.old}');
    print('Lop hs: ${this.grade}');
  }
}

class Card {
  int? idCard;
  int? borrowingDay;
  int? returnDay;
  int? idBook;
  var student = Student.init();

  Card.init() {}

  void import() {
    student.import();
    print("Nhap ma phieu muon: ");
    this.idCard = int.parse(stdin.readLineSync() ?? '0');
    print("Nhap ngay muon: ");
    this.borrowingDay = int.parse(stdin.readLineSync() ?? '0');
    print("Nhap ngay tra sach: ");
    this.returnDay = int.parse(stdin.readLineSync() ?? '0');
    print("Nhap ma so sach: ");
    this.idBook = int.parse(stdin.readLineSync() ?? '0');
  }

  void output() {
    student.output();
    print('Ma phieu: ${this.idCard}');
    print('Ngay muon: ${this.borrowingDay}');
    print('Ngay tra: ${this.returnDay}');
    print('Ma sach: ${this.idBook}');
  }
}

class ManageLibrary {
  List<Card> list = [];

  void import() {
    var card = Card.init();
    card.import();
    list.add(card);
  }

  void delete(int n) {
    var card = list.firstWhere((element) => element.idCard == n);
    if (card != null) {
      list.remove(card);
    }
    print("The da bi xoa!");
  }

  void output() {
    list.forEach((element) {
      print("----------------------------");
      element.output();
    });
  }
}

main() {
  var x = '''
  -----CHUONG TRINH QUAN LI THE MUON SACH-----
  1. Them thong tin the moi.
  2. Xoa the theo ma so the.
  3. In danh sach the muon.
  4. Thoat khoi chuong trinh.
''';
  print(x);
  int choose;
  var manage = ManageLibrary();
  do {
    print("Nhap lua chon cua ban: ");
    choose = int.parse(stdin.readLineSync() ?? '0');
    switch (choose) {
      case 1:
        manage.import();
        break;
      case 2:
        int n;
        print("Nhap vao Ma so card can xoa: ");
        n = int.parse(stdin.readLineSync() ?? '0');
        manage.delete(n);
        break;
      case 3:
        manage.output();
        break;
    }
  } while (choose < 4);
  print("Ket thuc chuong trinh!");
}
