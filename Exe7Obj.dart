// ignore_for_file: unnecessary_null_comparison

/*Khoa CNTT – DHKHTN cần quản lý việc thanh toán tiền lương cho các cán bộ giáo viên trong khoa.
Để quản lý được, khoa cần các thông tin sau:
Với mỗi cán bộ giáo viên có các thông tin sau:
lương cứng, lương thưởng, tiền phạt, lương thực lĩnh,
và các thông tin cá nhân: Họ tên, tuổi, quê quán, mã số giáo viên.
Yêu cầu 1: Xây dựng lớp Nguoi để quản lý các thông tin cá nhân của mỗi giáo viên.
Yêu cầu 2: Xây dựng lớp CBGV để quản lý các thông tin của các cán bộ giáo viên.
Yêu cầu 3: Xây dựng các phương thức thêm, xoá các cán bộ giáo viên theo mã số giáo viên.
Yêu cầu 4: Tính lương thực lĩnh cho giáo viên: Lương thực = Lương cứng + lương thưởng – lương phạt.*/

import 'dart:io';

class Salary {
  int? hard;
  int? bonus;
  int? penalty;
  int? total;

  Salary({this.hard, this.bonus, this.penalty, this.total});

  void import() {
    print('Nhap luong cung: ');
    this.hard = int.parse(stdin.readLineSync() ?? '0');
    print('Nhap luong thuong: ');
    this.bonus = int.parse(stdin.readLineSync() ?? '0');
    print('Nhap tien phat: ');
    this.penalty = int.parse(stdin.readLineSync() ?? '0');
  }

  int totalSalary() {
    this.total = this.hard! + this.bonus! - this.penalty!;
    return this.total!;
  }
}

class Teacher extends Salary {
  String? name;
  int? old;
  String? homeTown;
  int? id;

  Teacher.init() {}
  Teacher(this.name, this.old, this.homeTown, this.id, int? hard, int? bonus,
      int? penalty, int? total)
      : super(hard: hard, bonus: bonus, penalty: penalty, total: total);

  void import() {
    print("-----NHAP THONG TIN-----");
    print("Nhap ten: ");
    this.name = stdin.readLineSync();
    print("Nhap tuoi: ");
    this.old = int.parse(stdin.readLineSync() ?? '0');
    print("Nhap Que Quan: ");
    this.homeTown = stdin.readLineSync();
    print("Nhap MSGV: ");
    this.id = int.parse(stdin.readLineSync() ?? '0');
    super.import();
  }

  void output() {
    print("-----IN THONG TIN-----");
    print('Ten: ${this.name}');
    print('Tuoi: ${this.old}');
    print('Que Quan: ${this.homeTown}');
    print('MSGV: ${this.id}');
    print('Luong thuc linh: ${super.totalSalary()}');
  }
}

class ManageTeacher {
  List<Teacher> data = [];

  void import() {
    var teacher = Teacher.init();
    teacher.import();
    data.add(teacher);
  }

  void delete(int n) {
    var teacher = data.firstWhere((element) => element.id == n);
    if (teacher != null) {
      data.remove(teacher);
    }
    print("Thong tin giao vien da bi xoa!");
  }

  void output() {
    data.forEach((element) {
      print("----------------------------");
      element.output();
    });
  }
}

main() {
  var manage = ManageTeacher();
  int choose;
  do {
    var x = '''
      -----CHUONG TRINH QUAN LY GIAO VIEN-----
      1.  Them moi 1 giao vien.
      2.  Xoa 1 giao vien theo MSGV.
      3.  Tinh luong thuc linh cua tat ca giao vien.
      4.  Thoat khoi chuong trinh.
    ''';
    print(x);
    print("Nhap lua chon cua ban: ");
    choose = int.parse(stdin.readLineSync() ?? '0');
    switch (choose) {
      case 1:
        manage.import();
        break;
      case 2:
        print("Nhap MSGV can xoa: ");
        int n;
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
