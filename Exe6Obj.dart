/*Để quản lý hồ sơ học sinh của trường THPT nhà trường cần các thông tin sau:
Lớp,  và các thông tin về cá nhân của mỗi học sinh.
Mỗi học sinh có các thông tin sau: Họ tên, tuổi, quê quán.
Yêu cầu 1: Xây dựng class HocSinh để quản lý thông tin của mỗi học sinh.
Yêu cầu 2: Xây dựng các phương thức thêm, hiển thị thông tin của mỗi học sinh.
Yêu cầu 3: Cài đặt chương trình có các chức năng sau:
- Thêm học sinh mới.
- Hiện thị các học sinh 20 tuổi.
- Cho biết số lượng các học sinh có tuổi là 23 và quê ở DN*/

import 'dart:io';

class Student {
  String? name;
  int? old;
  String? homeTown;
  String? Class;

  Student.init() {}

  void importStudent() {
    print("Nhap ten cua hoc sinh: ");
    this.name = stdin.readLineSync();
    print("Nhap tuoi cua hoc sinh: ");
    this.old = int.parse(stdin.readLineSync() ?? '1');
    print("Nhap que quan cua hoc sinh: ");
    this.homeTown = stdin.readLineSync();
    print("Nhap lop cua hoc sinh: ");
    this.Class = stdin.readLineSync();
  }

  void printStudent() {
    print('Ten: ${this.name}');
    print('Tuoi: ${this.old}');
    print('Que quan: ${this.homeTown}');
    print('Lop: ${this.Class}');
  }
}

class School {
  List<Student> data = [];

  void inputStudent() {
    var student = Student.init();
    student.importStudent();
    data.add(student);
  }

  void outputStudent() {
    data.forEach((element) {
      print("------------------------------------");
      element.printStudent();
    });
  }

  void searchStudents(int x) {
    var student = data.where((element) => element.old == x);
    student.forEach((element) {
      element.printStudent();
    });
  }

  void countStudent(int x, String y) {
    int count = 0;
    for (int i = 0; i < data.length; i++) {
      if (data[i].old == x && data[i].homeTown == y) {
        print('So luong hoc sinh có tuoi $x, que quan $y la: ${++count}');
      }
    }
  }
}

main() {
  var x = '''
  ----------CHUONG TRINH QUAN LI HOC SINH----------
  1. Them moi 1 hoc sinh
  2. Tim kiem hoc sinh theo tuoi.
  3. Dem so luong hoc sinh theo tuoi va que quan
  4. In ra danh sach hoc sinh
  5. Thoat khoi chuong trinh.
''';
  print(x);
  var school = School();
  int choose;
  do {
    print("Nhap lua chon cua ban: ");
    choose = int.parse(stdin.readLineSync() ?? '0');
    switch (choose) {
      case 1:
        school.inputStudent();
        break;
      case 2:
        print("Nhap tuoi de tim hoc sinh: ");
        int x;
        x = int.parse(stdin.readLineSync() ?? '0');
        school.searchStudents(x);
        break;
      case 3:
        print("Nhap thong tin de tim hoc sinh: ");
        print("Tuoi: ");
        int x;
        x = int.parse(stdin.readLineSync() ?? '0');
        print("Que quan: ");
        String y;
        y = stdin.readLineSync()!;
        school.countStudent(x, y);
        break;
      case 4:
        school.outputStudent();
        break;
    }
    ;
  } while (choose < 5);
  print("Ket thuc chuong trinh");
}
