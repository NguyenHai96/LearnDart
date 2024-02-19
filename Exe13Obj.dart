// ignore_for_file: unused_field

/*Phần mềm quản lý nhân viên của công ty được mô tả nghiệp vụ như sau:
Mỗi nhân viên (Employee) được công ty chia thành 3 loại sau:
Nhân viên có kinh nghiệm lâu năm (Experience), nhân viên mới ra trường (Fresher) , Nhân viên thực tập (Intern)
Tất cả các Employee đều có các thuộc tính là:ID, FullName, BirthDay,Phone, Email, Employee_type,Employee_count
và phương thức là ShowInfo để hiển thị thông tin của nhân viên đó (hiển thị thông tin nhân viên ra màn hình console).

Trong đó :
Employee_typecó giá trị tương ứng là 0: Experience, 1: Fresher , 2: Intern 
(tùy vào người dùng nhập vào ứng viên loại nào)
Employee_count dùng để người dùng đếm số lượng nhân viên trong một đợt người dùng nhập nhân viên mới vào cơ sở dữ liệu.
(mỗi lần người dùng nhập thêm mới nhân viên thì thuộc tính Employee_count của class Employee sẽ tăng lên 1)

Ngoài ra :
Đối với nhân viên Experience có thêm thuộc tính: Số năm kinh nghiệm (ExpInYear), Kỹ năng chuyên môn (ProSkill)
Đối với nhân viênn Fresher có thêm thuộc tính:
Thời gian tốt nghiệp(Graduation_date), Xếp loại tốt nghiệp (Graduation_rank) , Trường tốt nghiệp (Education)
Đối với nhân viên Intern có thêm thuộc tính: Chuyên ngành đang học (Majors), Học kì đang học (Semester),
Tên trường đang học (University_name)

Lưu ý: Tùy mỗi loại nhân viên, phương thức showMe sẽ được bổ sung thêm các thuộc tính của riêng loại nhân viên đó.
** Ngoài ra mỗi nhân viên khi vào làm cần phải nộp bằng cấp nghề nghiệp đi kèm,
bộ phận tuyển dụng cần quản lý các bằng cấp này. Một nhân viên có thể có nhiều bằng cấp (Certificate)
Với mỗi bằng cấp có các thông tin bao gồm : CertificatedID, CertificateName, CertificateRank, CertificatedDate.

Yêu cầu
Viết chức năng cho phép thêm, sửa (Nhập ID để xác định một nhân viên
nếu tồn tại cho phép người dùng chỉnh sửa thông tin của nhân viên), xóa(xóa theo ID) các loại nhân viên trên.
Viết chương trình tìm tất cả các nhân viên intern.
Viết chương trình tìm tất cả các nhân viên experience .
Viết chương trình tìm tất cả các nhân viên fresher.*/

import 'dart:io';

enum EmployeeType { Experience, Fresher, Intern }

dynamic asEnumValue(List<dynamic> enumValues, int index) {
  try {
    return enumValues[index];
  } catch (err) {
    return null;
  }
}

class Certificate {
  int? id;
  String? name;
  String? rank;
  int? date;

  Certificate.init() {}

  void import() {
    print("Nhap vao ma bang cap: ");
    this.id = int.parse(stdin.readLineSync() ?? '0');
    print("Nhap vao ten bang cap: ");
    this.name = stdin.readLineSync();
    print("Nhap vao cap do ban cap: ");
    this.rank = stdin.readLineSync();
    print("Nhap vao ngay tot nghiep ban cap: ");
    this.date = int.parse(stdin.readLineSync() ?? '0');
  }

  void output() {
    print('Ma bang cap: ${this.id}');
    print('Ten bang cap: ${this.name}');
    print('Cap do tot nghiep: ${this.rank}');
    print('Ngay tot nghiep: ${this.date}');
  }
}

class Employee {
  int? id;
  String? name;
  String? birthday;
  int? phone;
  String? email;
  EmployeeType? type;
  List<Certificate> list = [];

  Employee({this.id, this.name, this.birthday, this.phone, this.email});

  void import() {
    print("Nhap vao ma so nhan vien: ");
    this.id = int.parse(stdin.readLineSync() ?? '0');
    print("Nhap vao ten nhan vien: ");
    this.name = stdin.readLineSync();
    print("Nhap vao ngay sinh nhan vien: ");
    this.birthday = stdin.readLineSync();
    print("Nhap vao std nhan vien: ");
    this.phone = int.parse(stdin.readLineSync() ?? '0');
    print("Nhap vao email nhan vien: ");
    this.email = stdin.readLineSync();
    int? n;
    print("Nhap vao so luong bang cap cua nhan vien: ");
    n = int.parse(stdin.readLineSync() ?? '0');
    for (int i = 0; i < n; i++) {
      var cate = Certificate.init();
      cate.import();
      list.add(cate);
    }
  }

  void output() {
    print('Ma nhan vien: ${this.id}');
    print('Ten nhan vien: ${this.name}');
    print('Ngay sinh: ${this.birthday}');
    print('Sdt: ${this.phone}');
    print('Email: ${this.email}');
    list.forEach((element) {
      element.output();
    });
  }
}

class Experience extends Employee {
  int? _expInYear;
  String? _proSkill;

  Experience(int? id, String? name, String? birthday, int? phone, String? email,
      this._expInYear, this._proSkill)
      : super(
            id: id, name: name, birthday: birthday, phone: phone, email: email);

  Experience.init() {}

  @override
  void import() {
    super.import();
    print("Nhap vao so nam kinh nghiem: ");
    this._expInYear = int.parse(stdin.readLineSync() ?? '0');
    print("Nhap vao ky nang chuyen mon: ");
    this._proSkill = stdin.readLineSync();
  }

  @override
  void output() {
    super.output();
    print('So nam kinh nghiem: ${this._expInYear}');
    print('Ky nang chuyen mon: ${this._proSkill}');
  }
}

class Fresher extends Employee {
  int? _graduation_date;
  String? _graduation_rank;
  String? _education;

  Fresher(int? id, String? name, String? birthday, int? phone, String? email,
      this._graduation_date, this._graduation_rank, this._education)
      : super(
            id: id, name: name, birthday: birthday, phone: phone, email: email);

  Fresher.init() {}

  @override
  void import() {
    super.import();
    print("Nhap ngay tot nghiep: ");
    this._graduation_date = int.parse(stdin.readLineSync() ?? '0');
    print("Nhap xep loai tot nghiep: ");
    this._graduation_rank = stdin.readLineSync();
    print("Nhap truong tot nghiep: ");
    this._education = stdin.readLineSync();
  }

  @override
  void output() {
    super.output();
    print('Thoi gian tot nghiep: ${this._graduation_date}');
    print('Xep loat tot nghiep: ${this._graduation_rank}');
    print('Truong tot nghiep: ${this._education}');
  }
}

class Intern extends Employee {
  String? _majors;
  int? _semester;
  String? _university;

  Intern(int? id, String? name, String? birthday, int? phone, String? email,
      this._majors, this._semester, this._university)
      : super(
            id: id, name: name, birthday: birthday, phone: phone, email: email);

  Intern.init() {}

  @override
  void import() {
    super.import();
    print("Nhap chuyen nganh dang hoc: ");
    this._majors = stdin.readLineSync();
    print("Nhap hoc ky dang hoc: ");
    this._semester = int.parse(stdin.readLineSync() ?? '0');
    print("Nhap truong dang hoc: ");
    this._university = stdin.readLineSync();
  }

  @override
  void output() {
    super.output();
    print('Chuyen nganh dang hoc: ${this._majors}');
    print('Hoc ky dang hoc: ${this._semester}');
    print('Truong dang hoc: ${this._university}');
  }
}

class EmployeeManage {
  List<dynamic> data = [];

  EmployeeManage() {}

  void import() {
    int n;
    print(
        "Nhap lua chon kieu nhan vien can them(0: Experience, 1:Fresher , 2:Intern):");
    n = int.parse(stdin.readLineSync() ?? '0');
    EmployeeType type = asEnumValue(EmployeeType.values, n);
    switch (type) {
      case EmployeeType.Experience:
        var experience = Experience.init();
        experience.import();
        experience.type = type;
        data.add(experience);
        break;
      case EmployeeType.Fresher:
        var fresher = Fresher.init();
        fresher.import();
        fresher.type = type;
        data.add(fresher);
        break;
      case EmployeeType.Intern:
        var intern = Intern.init();
        intern.import();
        intern.type = type;
        data.add(intern);
        break;
    }
    ;
  }

  void adjust() {
    int n;
    print("Nhap vao id nhan vien can sua thong tin");
    n = int.parse(stdin.readLineSync() ?? '0');
    var id = data.firstWhere((element) => element.id == n);
    if (id != null) {
      id.import();
      print("Thong tin nhan vien da duoc thay doi!");
    }
  }

  void delete() {
    int n;
    print("Nhap vao id nhan vien can xoa thong tin");
    n = int.parse(stdin.readLineSync() ?? '0');
    var id = data.firstWhere((element) => element.id == n);
    if (id != null) {
      data.remove(id);
      print("Thong tin cua nhan vien da bi xoa!");
    }
  }

  void output() {
    int n;
    print(
        "Nhap lua chon kieu nhan vien can tim(0: Experience, 1:Fresher , 2:Intern):");
    n = int.parse(stdin.readLineSync() ?? '0');
    EmployeeType type = asEnumValue(EmployeeType.values, n);
    switch (type) {
      case EmployeeType.Experience:
        data.forEach((element) {
          if (element.type == type) {
            element.output();
          }
        });
        break;
      case EmployeeType.Fresher:
        data.forEach((element) {
          if (element.type == type) {
            element.output();
          }
        });
        break;
      case EmployeeType.Intern:
        data.forEach((element) {
          if (element.type == type) {
            element.output();
          }
        });
        break;
    }
    ;
  }

  void searchEmployee() {
    String name;
    print("Nhap vao ten nhan vien can tim: ");
    name = stdin.readLineSync() ?? '0';
    data.forEach((element) {
      if (element.name == name) {
        element.output();
      }
    });
  }
}

main() {
  var manage = EmployeeManage();
  int choose;
  do {
    var x = '''
  -----CHUONG TRINH QUAN LY NHAN SU-----
  1. Them thong tin nhan vien
  2. Tim thong tin nhan vien va sua thong tin theo id.
  3. Xoa thong tin nhan vien theo id.
  4. Tim va In thong tin nhan vien theo yeu cau.
  5. Tim thong tin nhan vien theo ten nhan vien.
  6. Thoat khoi chuong trinh.
''';
    print(x);
    print('Nhap lua chon cua ban: ');
    choose = int.parse(stdin.readLineSync() ?? '0');
    switch (choose) {
      case 1:
        manage.import();
        break;
      case 2:
        manage.adjust();
        break;
      case 3:
        manage.delete();
        break;
      case 4:
        manage.output();
        break;
      case 5:
        manage.searchEmployee();
    }
    ;
  } while (choose < 6);
  print("Thoat khoi chuong trinh!");
}
