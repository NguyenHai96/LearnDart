/*Để quản lý các hộ dân cư trong một khu phố, người ta cần các thông tin sau:
Số thành viên trong gia đình, Số nhà, thông tin mỗi cá nhân trong gia đình.
Với mỗi cá nhân, người ta quản lý các thông tin sau:
Họ tên, Tuổi, Nghề nghiệp, số chứng minh nhân dân(duy nhất cho mỗi người).
Yêu cầu 1: Hãy xây dựng lớp Nguoi để quản lý thông tin của mỗi cá nhân.
Yêu cầu 2: Xây dựng lớp HoGiaDinh để quản lý thông tin của từng hộ gia đình.
Yêu cầu 2: Xây dựng lớp KhuPho để quản lý các thông tin của từng hộ gia đình.
Yêu cầu 3: Nhập n hộ dân. (n nhập từ bàn phím), hiển thị thông tin của các hộ trong khu phố.*/

import 'dart:io';

class Person{
  String? _name;
  int? _old;
  String? _job;
  String? _ccid;

  Person.name(){}

  void importPerson(){
    print("Nhap ten: ");  this._name = stdin.readLineSync();
    print("Nhap tuoi: "); this._old = int.parse(stdin.readLineSync()?? '1');
    print("Nhap cong viec: ");  this._job = stdin.readLineSync();
    print("Nhap CCID: "); this._ccid = stdin.readLineSync();
  }
  
  void printPerson(){
    print('Ten: ${this._name}');
    print('Tuoi: ${this._old}');
    print('Cong viec: ${this._job}');
    print('CCID: ${this._ccid}');
  }
}

class Family{
  int? amountPerson;
  String? add;
  List<Person> list = [];

  Family.name(){}

  void importFamily(){
    print("Nhap so nguoi trong gia dinh: "); 
    this.amountPerson = int.parse(stdin.readLineSync()??'0');
    for(int i = 0; i < this.amountPerson!; i++){
      var people = Person.name();
      print('Thong tin nguoi: ${i + 1}');
      people.importPerson();
      list.add(people);
    }
    print("Nhap dia chi ho gia dinh: ");
    this.add = stdin.readLineSync();
  }

  void printFamily(){
    print("---------------------------------");
    list.forEach((element) => element.printPerson());
    print('Dia chi: ${this.add}');
  }
}

class Town {
  int? house;
  List<Family> data = [];
  
  Town(this.house);
  Town.name(){}

  void inputTown(){
    print("Nhap so ho gia dinh trong khu pho: ");  
    this.house = int.parse(stdin.readLineSync()??'0');
    for(int i = 0; i < this.house!; i++){
      var family = Family.name();
      print('Ho gia dinh ${i + 1}: ');
      family.importFamily();
      data.add(family);
    }
  }

  void outputTown(){
    for(int i = 0; i < data.length; i++){
      print("---------------------------------");
      print('Ho gia dinh ${i + 1}: ');
      data[i].printFamily();
    }
  }
}

main(){
  var town = Town.name();
  town.inputTown();
  town.outputTown();
}