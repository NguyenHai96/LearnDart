// ignore_for_file: dead_code

/*Xây dựng chương trình quản lý kết quả học tập của sinh viên tại một trường đại học.
Có 2 loại sinh viên là sinh viên chính quy và sinh viên tại chức với các thông tin giống nhau:
mã sinh viên, họ tên, ngày tháng năm sinh, năm vào học, điểm đầu vào và danh sách kết quả học tập.
Sinh viên tại chức có thêm thông tin nơi liên kết đào tạo(Đồng Nai, Cà Mau, …).
Khoa gồm có các thông tin: tên khoa và danh sách sinh viên đang theo học.
Kết quả học tập gồm có tên học kỳ, điểm trung bình học kỳ đó.
Hiện thực các yêu cầu sau:
Hiện thực các lớp cần thiết cho bài toán trên
Phương thức input và output để cho phép người dùng nhập thông tin cho các
loại sinh viên
Phương thức xác định sinh viên có phải là chính quy hay không?
Xử lý Exception khi người dùng nhập sai dữ liệu
Phương thức lấy điểm trung bình các môn học của sinh viên dựa vào học kỳ
cho trước
Phương thức xác định tổng số sinh viên chính quy của khoa?
Tìm ra sinh viên có điểm đầu vào cao nhất ở mỗi khoa
Ở mỗi khoa, lấy ra danh sách các sinh viên tại chức tại nơi liên kết đào tạo cho
trước
Ở mỗi khoa, lấy ra danh sách sinh viên có điểm trung bình ở học kỳ gần nhất
(là học kỳ cuối cùng trong danh sách kết quả học tập của sinh viên) từ 8.0 trở
lên
Ở mỗi khoa, tìm ra sinh viên có điểm trung bình học kỳ cao nhất (ở bất kỳ học
kỳ nào)
Ở mỗi khoa, sắp xếp danh sách sinh viên tăng dần theo loại và giảm dần theo
năm vào học (sử dụng interface Comparable hoặc Comparator)
Ở mỗi khoa, thống kê số lượng sinh viên theo năm vào học. Ví dụ 2020: 100,
2019: 90, 2018: 120.*/

import 'dart:io';

enum StudentType { InService, Regular }

dynamic asEnumValue(List<dynamic> enumValues, int index) {
  try {
    return enumValues[index];
  } catch (err) {
    return null;
  }
}

class InvalidDOBException implements IOException {
  String mess;
  InvalidDOBException({required this.mess});
}

class LearnResult {
  String? semesterName;
  double? mediumScore;

  LearnResult.init() {}

  void import() {
    print("Nhap Ten hoc ky: ");
    this.semesterName = stdin.readLineSync();
    print("Nhap Diem Trung Binh: ");
    this.mediumScore = double.parse(stdin.readLineSync() ?? '0');
  }

  void output() {
    print('Ten hoc ky: ${this.semesterName}');
    print('Diem Trung Binh: ${this.mediumScore}');
  }

  double getScore() {
    return this.mediumScore ?? 0;
  }
}

class Student {
  int? id;
  String? name;
  String birthday = '';
  int? yearOfAdmission;
  int? entryTestScore;
  StudentType? type;
  List<LearnResult> list = [];

  void import() {
    print("Nhap Ma SV: ");
    this.id = int.parse(stdin.readLineSync() ?? '0');
    print("Nhap Ten SV: ");
    this.name = stdin.readLineSync();
    do {
      try {
        print("Nhap Ngay Sinh SV: ");
        this.birthday = stdin.readLineSync().toString();
        if (!dateOfBirthValidate()) {
          throw new InvalidDOBException(mess: 'Ngay sinh nhap khong hop le!');
        }
      } catch (err) {
        print('Lỗi nhập ngày tháng năm sinh $err');
      }
    } while (!dateOfBirthValidate());
    print("Nhap nam nhap hoc: ");
    this.yearOfAdmission = int.parse(stdin.readLineSync() ?? '0');
    print("Nhap diem Test dau vao: ");
    this.entryTestScore = int.parse(stdin.readLineSync() ?? '0');
    print("Nhap vao so hoc ky Sv da hoc: ");
    int n = int.parse(stdin.readLineSync() ?? '0');
    for (int i = 0; i < n; i++) {
      var result = LearnResult.init();
      result.import();
      list.add(result);
    }
  }

  bool dateOfBirthValidate() {
    List<String> listBrithday = this.birthday.split('/');
    if (listBrithday.length != 3 ||
        int.tryParse(listBrithday[0]).runtimeType != int ||
        int.tryParse(listBrithday[1]).runtimeType != int ||
        int.tryParse(listBrithday[2]).runtimeType != int) {
      return false;
    }
    do {
      switch (int.parse(listBrithday[1])) {
        case 1 || 3 || 5 || 7 || 8 || 10 || 12:
          return int.parse(listBrithday[0]) < 32 &&
              int.parse(listBrithday[0]) > 0 &&
              int.parse(listBrithday[2]) > 1000;
        case 4 || 6 || 9 || 11:
          return int.parse(listBrithday[0]) < 31 &&
              int.parse(listBrithday[0]) > 0 &&
              int.parse(listBrithday[2]) > 1000;
        case 2:
          return int.parse(listBrithday[0]) < 30 &&
              int.parse(listBrithday[0]) > 0 &&
              int.parse(listBrithday[2]) > 1000;
        default:
          return false;
      }
      ;
    } while (int.parse(listBrithday[1]) < 0 || int.parse(listBrithday[1]) > 12);
  }

  void output() {
    print('Ma SV: ${this.id}');
    print('Ten SV: ${this.name}');
    print('Ngay sinh SV: ${this.birthday}');
    print('Nam nhap hoc: ${this.yearOfAdmission}');
    print('Diem test dau vao: ${this.entryTestScore}');
    list.forEach((element) {
      element.output();
    });
  }

  int getTestScore() {
    return this.entryTestScore ?? 0;
  }

  double maxMediumScore() {
    list.sort((a, b) => b.getScore().compareTo(a.getScore()));
    return list[0].getScore();
  }

  int getYear() {
    return this.yearOfAdmission ?? 0;
  }
}

class InServiceStudent extends Student {
  String? _trainJoinPlace;

  InServiceStudent.init() {}

  @override
  void import() {
    super.import();
    print("Nhap noi lien ket dao tao: ");
    this._trainJoinPlace = stdin.readLineSync();
  }

  @override
  void output() {
    print("---Sinh vien he tai chuc---");
    super.output();
    print('Noi lien ket dao tao: ${this._trainJoinPlace}');
  }

  String getPlace() {
    return this._trainJoinPlace ?? '';
  }
}

class RegularStudent extends Student {
  @override
  void import() {
    super.import();
  }

  @override
  void output() {
    print("---Sinh vien he chinh quy---");
    super.output();
  }
}

class Department {
  String? name;
  List<dynamic> studentData = [];

  Department.init() {}

  void import() {
    print("Nhap ten Khoa: ");
    this.name = stdin.readLineSync();
    print(
        "Nhap kieu sinh vien dang theo hoc tai Khoa (0: Sinh vien tai chuc , 1: Sinh vien chinh quy)");
    int choose = int.parse(stdin.readLineSync() ?? '0');
    StudentType type = asEnumValue(StudentType.values, choose);
    switch (type) {
      case StudentType.InService:
        var student = InServiceStudent.init();
        student.import();
        student.type = type;
        studentData.add(student);
        break;
      case StudentType.Regular:
        var student = RegularStudent();
        student.import();
        student.type = type;
        studentData.add(student);
        break;
    }
  }

  void printRegularStudent() {
    print("Cac sinh vien thuoc he chinh quy la: ");
    studentData.forEach((element) {
      if (element.type == StudentType.Regular) {
        element.output();
      }
    });
  }

  void countRegularStudent() {
    var regularStudents =
        studentData.where((element) => element.type == StudentType.Regular);
    var count = regularStudents.length;
    print('So luong sinh vien thuoc he chinh quy la: $count');
  }

  void maxTestScore() {
    studentData.sort((a, b) => b.getTestScore().compareTo(a.getTestScore()));
    studentData[0].output();
  }

  void maxMediumScore() {
    studentData
        .sort((a, b) => b.maxMediumScore().compareTo(a.maxMediumScore()));
    studentData[0].output();
  }

  void searchStudent() {
    print("Nhap vao dia chi hoc tai chuc cua sinh vien: ");
    String trainJoinPlace = stdin.readLineSync() ?? '';
    for (int i = 0; i < studentData.length; i++) {
      if (studentData[i].type == StudentType.InService &&
          studentData[i].getPlace() == trainJoinPlace) {
        studentData[i].output();
      }
    }
  }

  void arrange() {
    this.studentData.sort((a, b) => b.getYear().compareTo(a.getYear()));
    print("Danh sach sinh vien sau khi sap xep: ");
    for (var element in studentData) {
      element.output();
    }
  }

  void printStudent() {
    print("Nhap vao nam nhap hoc cua sinh vien: ");
    int year = int.parse(stdin.readLineSync() ?? '');
    studentData.forEach((element) {
      if (element.yearOfAdmission == year) {
        element.output();
      }
    });
  }
}

main() {
  var department = Department.init();
  int choose;
  do {
    var x = '''
  -----CHUONG TRINH QUAN LY KET QUA HOC TAP CUA SINH VIEN-----
  1. Nhap vao thong tin sinh vien.
  2. In ra danh sach co sinh vien thuoc he chinh quy.
  3. Tinh tong so sinh vien chinh quy cua khoa.
  4. Tim sinh vien co diem dau vao cao nhat.
  5. Nhap vao noi tai chuc cua sinh vien tim ra cac sinh vien dang tai chuc o do.
  6. Tim sinh vien co diem trung binh hoc ky cao nhat.
  7. Sap xep danh sach sinh vien tang dan theo loai va giam dan theo nam hoc.
  8. Thong ke sinh vien theo hoc theo nam nhap hoc.
  9. Thoai khoi chuong trinh.
  ''';
    print(x);
    print('-------------------------------------------------');
    print("Nhap vao lua chon cua ban: ");
    choose = int.parse(stdin.readLineSync() ?? '0');
    switch (choose) {
      case 1:
        department.import();
        break;
      case 2:
        department.printRegularStudent();
        break;
      case 3:
        department.countRegularStudent();
        break;
      case 4:
        department.maxTestScore();
        break;
      case 5:
        department.searchStudent();
        break;
      case 6:
        department.maxMediumScore();
        break;
      case 7:
        department.arrange();
        break;
      case 8:
        department.printStudent();
        break;
    }
  } while (choose < 9);
  print("Ket thuc chuong trinh!");
}
