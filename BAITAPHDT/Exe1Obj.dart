// ignore_for_file: unused_local_variable

/*Một đơn vị sản xuất gồm có các cán bộ là công nhân, kỹ sư, nhân viên.
Mỗi cán bộ cần quản lý các dữ liệu: Họ tên, tuổi, giới tính(name, nữ, khác), địa chỉ.
Cấp công nhân sẽ có thêm các thuộc tính riêng: Bậc (1 đến 10).
Cấp kỹ sư có thuộc tính riêng: Nghành đào tạo.
Các nhân viên có thuộc tính riêng: công việc.
Yêu cầu 1: Xây dựng các lớp CongNhan, KySu, NhanVien kế thừa từ lớp CanBo.

Yêu cầu 2: Xây dựng lớp QLCB(quản lý cán bộ) cài đặt các phương thức thực hiện các chức năng sau:

Thêm mới cán bộ.
Tìm kiếm theo họ tên.
Hiện thị thông tin về danh sách các cán bộ.
Thoát khỏi chương trình. */

import 'dart:io';

class Employee{
    String? name;
    int? old;
    String? sex;
    String? add;

    Employee({this.name,this.old, this.sex, this.add});

    void importEmployee(){
      print("Nhap ten can bo: ");
      this.name = stdin.readLineSync();
      print("Nhap tuoi can bo: ");
      this.old = int.parse(stdin.readLineSync() ?? "0");
      print("Nhap gioi tinh can bo: ");
      this.sex = stdin.readLineSync();
      print("Nhap dia chi can bo: ");
      this.add = stdin.readLineSync();
    }

    void printEmployee(){
      print('Ten: ${this.name}');
      print('Tuoi: ${this.old}');
      print('Gioi tinh: ${this.sex}');
      print('Dia chi: ${this.add}');
    }
}

class Worker extends Employee{
    num? _level;

    Worker.body(){}
    Worker(String? name, int? old, String? sex, String? add, this._level):super(name: name, old: old, sex: sex,add: add);

    void importWorker(){
      super.importEmployee();
      print("Nhap cap bac can bo: ");
      this._level = int.parse(stdin.readLineSync()??"0");
    }

    void printEmployee(){
      super.printEmployee();
      print('Cap do: ${this._level}'); 
    }  
}

class Engineer extends Employee{
    String? _Specialized;

    Engineer.body();
    Engineer(String? name, int? old, String? sex, String? add, this._Specialized):super(name: name, old: old, sex: sex,add: add);

    void importEngineer(){
      super.importEmployee();
      print("Nhap ban cap can bo: ");
      this._Specialized = stdin.readLineSync();
    }

    void printEmployee(){
      super.printEmployee();
      print('Chuyen nganh: ${this._Specialized}');
    }
}

 class Officer extends Employee{
    String? _job;

    Officer.body(){}
    Officer(String? name, int? old, String? sex, String? add,this._job):super(name: name, old: old, sex: sex,add: add);

    void importOfficer(){
      super.importEmployee();
      print("Nhap cong viec cua can bo: ");
      this._job = stdin.readLineSync();
    }

    void printEmployee(){
      super.printEmployee();
      print('Cong viec: ${this._job}');
    }
}

class ManageStaff{
    List<dynamic> list = [];

    ManageStaff(){}
    
    void inputEmployee(){
      String? positon;
      print("Nhap chuc vu can nhap: ");
      positon = stdin.readLineSync();
      if(positon == 'cong nhan'){
        var worker = Worker.body();
        worker.importWorker();
        list.add(worker);
      }else{
        if(positon == 'ky su'){
          var engineer = Engineer.body();
          engineer.importEngineer();
          list.add(engineer);
        }else{
          if(positon == 'nhan vien'){
            var officer = Officer.body();
            officer.importOfficer();
            list.add(officer);
          }else{
            print("Nhap sai chuc vu nhan vien!");
          }
        }
      }
    }

    void searchName(String x){
      var employees = list.where((element) => element.name == x); //cach 3
      employees.forEach((element){
        element.printEmployee();
      });
      // var employee = list.firstWhere((element) => element.name == x);  //cach 2
      // employee.printEmployee();          //cach 1
      // for(int i = 0; i < list.length; i++){
      //   if(x == list[i].name)
      //     list[i].printEmployee();
      // }
    }

    void showStaff(){
      for(int i = 0; i < list.length; i++){
        list[i].printEmployee();
      }
    }
}

main(){

  var x = '''CHON CAC LUA CHON
  1. Them moi 1 can bo
  2. Tim kiem theo ho va ten
  3. Hien thi thong tin ve danh sach can bo
  4. Thoat khoi chuong trinh
  ''';
  print(x);
  int choose;
  var manage = ManageStaff();
  do{
    print("Nhap yeu cau can chon: ");
    choose = int.parse(stdin.readLineSync() ?? "0");
    switch(choose){
      case 1:
          manage.inputEmployee();
          print("-----------------------------------------------");
          break;
      case 2:
          print("Nhap ten can bo can tim: ");
          String? x = stdin.readLineSync();
          manage.searchName(x!);
          print("-----------------------------------------------");
          break;
      case 3:
          manage.showStaff();
          print("-----------------------------------------------");
          break;
    };
  }while(choose < 4);
  print("Ket thuc chuong trinh");
  print("-----------------------------------------------");
  
  return 0;
}