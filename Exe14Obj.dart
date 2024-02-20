// ignore_for_file: unused_field, dead_code

/*Viết chương trình quản lý việc tuyển sinh viên sau khi tốt nghiệp đại học.

Có 2 loại sinh viên bao gồm sinh viên tốt nghiệp loại khá giỏi (GoodStudent) và sinh viên tốt nghiệp loại trung bình (NormalStudent).
Cả 2 loại sinh viên trên đều phải cung cấp các thông tin sau khi nộp hồ sơ xin việc:
Họ tên (fullName), Ngày tháng năm sinh (doB), Giới tính (sex), Số điện thoại (phoneNumber),
Tên trường đã học (universityName), Xếp loại tốt nghiệp (gradeLevel).
Riêng sinh viên loại khá giỏi phải có thêm thông tin: điểm trung bình học tập (gpa) theo thang điểm 10
tên của loại học bổng (hoặc giải thưởng) cao nhất đã từng giành được (bestRewardName).
Riêng sinh viên loại trung bình thì phải có thêm các thông tin: điểm TOEIC (englishScore)
điểm thi đầu vào chuyên môn do công ty tổ chức thi (entryTestScore) theo thang điểm 10.
Yêu cầu 1:
Thí sinh hãy thiết kế và viết code thể hiện các class của các sinh viên áp dụng 4 tính chất : bao đóng, kế thừa, đa hình, trừu tượng.
Lưu ý: Bất kì một sinh viên nào cũng cần có một phương thức có tên là ShowMyInfor
để hiển thị thông tin của sinh viên đó ra màn hình cosole, yêu cầu này là bắt buộc với các thành viên xây dựng code cho chương trình này.
Bạn hãy lưu ý khi thiết kế code để thỏa mãn yêu cầu này.

Yêu Cầu 2 : Kiểm tra ràng buộc dữ liệu cho chương trình. Dữ liệu của các file input phải tuân thủ theo ràng buộc sau:
– Họ tên sinh viên có chiều dài tối đa là 50 ký tự và tổi thiểu là 10 ký tự. Học viên cần tạo Exception tương ứng có tên là InvalidFullNameException (1 điểm).
– Chương trình phải bắt được lỗi sai định dạng ngày tháng năm đối với trường doB.
doB phải theo định dạng DD/MM/YYYY. Học viên cần tạo Exception tương ứng có tên là InvalidDOBException (1 điểm).
– Số điện thoại: phải là chuỗi số có chiều dài 10 ký tự và phải bắt đầu bằng một trong các chuỗi số: 090, 098, 091, 031, 035 hoặc 038.
Học viên cần tạo Exception tương ứng có tên là InvalidPhoneNumberException (1 điểm).
– Ngoài ra nếu có bất cứ một exception nào khác trong quá trình thực thi chương trình
thí sinh hãy thông báo ra màn hình nội dung “Input files have unknow errors !!!”  (0.5 điểm).

Yêu cầu 3: Chương trình cần có chức năng lựa chọn ứng viên trúng tuyển vào công ty theo nguyên tắc sau:
Người dùng sẽ nhập vào số lượng sinh viên cần tuyển dụng (tối thiểu là 11, tối đa là 15).
Chương trình sẽ tự động chọn ra ứng viên phù hợp cho công ty theo các bước như sau:
Nếu số lượng ứng viên là sinh viên khá giỏi có nhiều hơn số lượng cần tuyển thì xét ưu tiên theo điểm GPA.
Nếu xuất hiện ứng viên khá giỏi có cùng điểm GPA thì xét ưu tiên theo họ tên. 
Vd: nếu họ tên là Nguyễn Văn A và Nguyễn Văn B thì ứng viên Nguyễn Văn A được chọn. 
(Giả sử không bao giờ có sinh viên có trùng họ tên nhau).
Nếu số lượng ứng viên là sinh viên khá giỏi ít hơn hoặc bằng số lượng cần tuyển thì nhận hết sinh viên khá giỏi.
Sau khi tuyển hết ứng viên khá giỏi, nếu vẫn chưa đủ số lượng cần tuyển, chương trình sẽ lấy ứng viên trung bình. 
Các ứng viên trung bình được xét ưu tiên theo điểm thi đầu vào, nếu điểm thi đầu vào bằng nhau thì xét đến điểm TOEIC. 
Nếu xuất hiện ứng viên trung bình có cùng điểm TOEIC thì xét ưu tiên theo họ tên.
Yêu cầu 4: Chương trình có thể hiển thị được thông tin họ tên và số điện thoại của 
tất cả các sinh viên đã nhập vào hệ thống (yêu cầu dùng collection sort để sắp xếp giảm dần theo 
fullName và tăng dần theo phoneNumber đối với sinh viên trước khi hiển thị).*/

import 'dart:io';

enum GradeLevel { Good, Normal }

dynamic asEnumValue(List<dynamic> enumValues, int index) {
  try {
    return enumValues[index];
  } catch (err) {
    return null;
  }
}

class InvalidFullNameException extends IOException {
  String mess;
  InvalidFullNameException({required this.mess});
}

class InvalidDOBException implements IOException {
  String mess;
  InvalidDOBException({required this.mess});
}

class InvalidPhoneNumberException implements IOException {
  String mess;
  InvalidPhoneNumberException({required this.mess});
}

class Student {
  String name = '';
  String birthday = '';
  String? sex;
  String phone = '';
  String? university;

  void import() {
    do {
      try {
        print("Nhap vao ten sinh vien: ");
        this.name = stdin.readLineSync().toString();
        if (this.name.length > 50 || this.name.length < 10) {
          throw new InvalidFullNameException(
              mess: 'Ten nhap vao khong hop le!');
        }
      } catch (err) {
        print('Lỗi nhập Họ và tên $err');
      }
    } while (this.name.length > 50 || this.name.length < 10);
    do {
      try {
        print("Nhap vao ngay sinh cua sinh vien: ");
        this.birthday = stdin.readLineSync().toString();
        if (!dateOfBirthValidate()) {
          throw new InvalidDOBException(mess: 'Ngay sinh nhap khong hop le!');
        }
      } catch (err) {
        print('Lỗi nhập ngày tháng năm sinh $err');
      }
    } while (!dateOfBirthValidate());
    print("Nhap gioi tinh cua sinh vien: ");
    this.sex = stdin.readLineSync();
    do {
      try {
        print("Nhap so dien thoai cua sinh vien: ");
        this.phone = stdin.readLineSync().toString();
        if (!phoneValidate()) {
          throw new InvalidPhoneNumberException(
              mess: 'So dien thoai ko hop le!');
        }
      } catch (errors) {
        print('Lỗi nhập số điện thoại $errors');
      }
    } while (!phoneValidate());
    print("Nhap truong dai hoc cua sinh vien: ");
    this.university = stdin.readLineSync();
  }

  bool dateOfBirthValidate() {
    List<String> listBrithday = this.birthday.split('/');
    do {
      switch (int.parse(listBrithday[1])) {
        case 1 || 3 || 5 || 7 || 8 || 10 || 12:
          return int.parse(listBrithday[0]).runtimeType == int &&
              int.parse(listBrithday[0]) < 32 &&
              int.parse(listBrithday[0]) > 0;
        case 4 || 6 || 9 || 11:
          return int.parse(listBrithday[0]).runtimeType == int &&
              int.parse(listBrithday[0]) < 31 &&
              int.parse(listBrithday[0]) > 0;
        case 2:
          return int.parse(listBrithday[0]).runtimeType == int &&
              int.parse(listBrithday[0]) < 30 &&
              int.parse(listBrithday[0]) > 0;
        default:
          return false;
      }
      ;
    } while (int.parse(listBrithday[1]) < 0 || int.parse(listBrithday[1]) > 12);
  }

  bool phoneValidate() {
    return int.parse(this.phone) == int ||
        this.phone.length == 10 ||
        this.phone.substring(0, 2) == '090' ||
        this.phone.substring(0, 2) == '098' ||
        this.phone.substring(0, 2) == '091' ||
        this.phone.substring(0, 2) == '031' ||
        this.phone.substring(0, 2) == '035' ||
        this.phone.substring(0, 2) == '038';
  }

  void showMyInfor() {
    print('Ten sv: ${this.name}');
    print('Ngay sinh: ${this.birthday}');
    print('Gioi tinh sv: ${this.sex}');
    print('Sdt: ${this.phone}');
    print('Tot nghiep dai hoc: ${this.university}');
  }
}

class GoodStudent extends Student {
  int? _gpa;
  String? _bestRewardName;

  GoodStudent.init() {}

  @override
  void import() {
    super.import();
    print("Nhap vao diem GPA: ");
    this._gpa = int.parse(stdin.readLineSync() ?? '0');
    print("Nhap vao ten giai thuong hoac hoc bong: ");
    this._bestRewardName = stdin.readLineSync();
  }

  @override
  void showMyInfor() {
    super.showMyInfor();
    print('Diem GPA: ${this._gpa}');
    print('Ten hoc bong/ Ten giai thuong: ${this._bestRewardName}');
  }

  int getScore() {
    return this._gpa ?? 0;
  }
}

class NormalStudent extends Student {
  int? _englishScore;
  int? _entryTestScore;

  NormalStudent.init() {}

  @override
  void import() {
    super.import();
    print("Nhap vao diem TOEIC: ");
    this._englishScore = int.parse(stdin.readLineSync() ?? '0');
    print("Nhap vao diem Test: ");
    this._entryTestScore = int.parse(stdin.readLineSync() ?? '0');
  }

  @override
  void showMyInfor() {
    super.showMyInfor();
    print('Diem TOEIC: ${this._englishScore}');
    print('Diem test dau vao: ${this._entryTestScore}');
  }

  int getScore() {
    return this._entryTestScore ?? 0;
  }
}

class EmployeeSelective {
  List<GoodStudent> listStudentGood = [];
  List<NormalStudent> listStudentNormal = [];

  EmployeeSelective() {}

  void import() {
    int n;
    print(
        "Nhap lua chon loai sinh vien can them(0: Sinh vien Kha gioi, 1: Sinh vien trung binh)");
    n = int.parse(stdin.readLineSync() ?? '0');
    GradeLevel level = asEnumValue(GradeLevel.values, n);
    switch (level) {
      case GradeLevel.Good:
        var employee = GoodStudent.init();
        employee.import();
        listStudentGood.add(employee);
        break;
      case GradeLevel.Normal:
        var employee = NormalStudent.init();
        employee.import();
        listStudentNormal.add(employee);
        break;
    }
  }

  void collectStudent() {
    int employeeMaxNumber;
    do {
      print("Nhap vao so luong nhan vien( 11 < so luong nhan vien < 15)");
      employeeMaxNumber = int.parse(stdin.readLineSync() ?? '0');
    } while (employeeMaxNumber > 15 || employeeMaxNumber < 11);
    if (employeeMaxNumber == listStudentGood.length) {
      listStudentGood.forEach((element) {
        element.showMyInfor();
      });
    } else {
      if (listStudentGood.length < employeeMaxNumber) {
        listStudentGood.forEach((element) {
          element.showMyInfor();
        });
        int missingEmployee = employeeMaxNumber - listStudentGood.length;
        this
            .listStudentNormal
            .sort((a, b) => b.getScore().compareTo(a.getScore()));
        for (int i = 0; i < missingEmployee; i++) {
          listStudentNormal[i].showMyInfor();
        }
      } else {
        this
            .listStudentGood
            .sort((a, b) => b.getScore().compareTo(a.getScore()));
        for (int i = 0; i < employeeMaxNumber; i++) {
          listStudentGood[i].showMyInfor();
        }
      }
    }
  }
}

main() {
  var employee = EmployeeSelective();
  int choose;
  do {
    var x = '''
  -----CHUONG TRINH TUYEN DUNG NHAN VIEN-----
  1. Them sinh vien vao danh sach.
  2. Danh sach tuyen chon nhan vien.
  ''';
    print(x);
    print("Nhap lua chon cua ban: ");
    choose = int.parse(stdin.readLineSync() ?? '0');
    switch (choose) {
      case 1:
        employee.import();
        break;
      case 2:
        employee.collectStudent();
        break;
    }
  } while (choose < 3);
  print("Ket thuc chuong trinh!");
}
