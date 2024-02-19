/*Nghành công an cần quản lý các phương tiện giao thông gồm: ô tô, xe máy, xe tải.
Mỗi loại gồm các thông tin: ID, Hãng sản xuất, năm sản xuất, giá bán và màu xe.
Các ô tô có các thuộc tính riêng: số chỗ ngồi, kiểu động cơ.
Các xe máy có các thuộc tính riêng: công xuất.
Xe tải cần quản lý thêm: Trọng tải.
Yêu cầu 1: Xây dựng các lớp để quản lý các phương tiện trên sao cho hiệu quả.
Yêu cầu 2: Xây dựng lớp QLPTGT có các chức năng:
Thêm, xoá(theo ID) các phương tiện thuộc các loại trên.
Tìm phương tiện theo hãng sản xuất, màu.
Thoát chương trình.*/

import 'dart:io';

enum CarType { Oto, Moto, Truck }

dynamic asEnumValue(List<dynamic> enumValues, int index) {
  try {
    return enumValues[index];
  } catch (err) {
    return null;
  }
}

class Car {
  int? id;
  String? brand;
  int? year;
  int? price;
  String? color;

  Car({this.id, this.brand, this.year, this.price, this.color});

  void import() {
    print("Nhap ma xe: ");
    this.id = int.parse(stdin.readLineSync() ?? '0');
    print("Nhap hang xe: ");
    this.brand = stdin.readLineSync();
    print("Nhap nam san xuat: ");
    this.year = int.parse(stdin.readLineSync() ?? '0');
    print("Nhap gia xe: ");
    this.price = int.parse(stdin.readLineSync() ?? '0');
    print("Nhap mau xe: ");
    this.color = stdin.readLineSync();
  }

  void output() {
    print('ID: ${this.id}');
    print('Hang xe: ${this.brand}');
    print('Nam sx: ${this.year}');
    print('gia xe: ${this.price}');
    print('Mau xe: ${this.color}');
  }
}

class Oto extends Car {
  int? seats;
  String? engine;

  Oto(int? id, String? brand, int? year, int? price, String? color, this.seats,
      this.engine)
      : super(id: id, brand: brand, year: year, price: price, color: color);
  Oto.init() {}

  @override
  void import() {
    super.import();
    print("Nhap vao so cho ngoi tren xe: ");
    this.seats = int.parse(stdin.readLineSync() ?? '0');
    print("Nhap vao kieu dong co: ");
    this.engine = stdin.readLineSync();
  }

  @override
  void output() {
    super.output();
    print('So cho ngoi: ${this.seats}');
    print('Kieu dong co: ${this.engine}');
  }
}

class Moto extends Car {
  int? wattage;

  Moto(int? id, String? brand, int? year, int? price, String? color,
      this.wattage)
      : super(id: id, brand: brand, year: year, price: price, color: color);
  Moto.init() {}

  @override
  void import() {
    super.import();
    print("Nhap vao cong suat xe: ");
    this.wattage = int.parse(stdin.readLineSync() ?? '0');
  }

  @override
  void output() {
    super.output();
    print('Cong suat xe: ${this.wattage}');
  }
}

class Truck extends Car {
  int? weight;

  Truck(
      int? id, String? brand, int? year, int? price, String? color, this.weight)
      : super(id: id, brand: brand, year: year, price: price, color: color);
  Truck.init() {}

  @override
  void import() {
    super.import();
    print("Nhap vao tai trong xe(theo Tan): ");
    this.weight = int.parse(stdin.readLineSync() ?? '0');
  }

  @override
  void output() {
    super.output();
    print('Tai trong xe(theo Tan): ${this.weight}');
  }
}

class TrafficManage {
  List<dynamic> data = [];

  TrafficManage() {}

  void import() {
    int n;
    print(
        "Nhap vao loai xe can them vao (0: xe oto, 1: xe moto , 2: xe tai): ");
    n = int.parse(stdin.readLineSync() ?? '0');
    CarType type = asEnumValue(CarType.values, n);
    switch (type) {
      case CarType.Oto:
        var oto = Oto.init();
        oto.import();
        data.add(oto);
        break;
      case CarType.Moto:
        var moto = Moto.init();
        moto.import();
        data.add(moto);
        break;
      case CarType.Truck:
        var truck = Truck.init();
        truck.import();
        data.add(truck);
        break;
    }
    ;
  }

  void delete() {
    print("Nhap vao id xe can xoa: ");
    int n;
    n = int.parse(stdin.readLineSync() ?? '0');
    var car = data.firstWhere((element) => element.id == n);
    if (car != null) {
      data.remove(car);
    }
    print("Thong tin xe da bi xoa!");
  }

  void searchCar() {
    String? color;
    String? brand;

    print("Nhap vao hang san xuat xe can tim: ");
    brand = stdin.readLineSync();
    print("Nhap vao mau sac cua xe can tim: ");
    color = stdin.readLineSync();
    var car = data.firstWhere(
        (element) => element.brand == brand && element.color == color);
    if (car != null) {
      print('Xe tim dc la: ');
      car.output();
    } else {
      print('Khong tim thay thong tin xe');
    }
  }

  void searchIDCar() {
    int id;
    print("Nhap vao id cua xe can tim: ");
    id = int.parse(stdin.readLineSync() ?? '0');
    var car = data.firstWhere((element) => element.id == id);
    if (car != null) {
      print("Thong tin xe tim duoc la: ");
      car.output();
    } else {
      print("Khong tim thay thong tin xe");
    }
  }
}

main() {
  var manage = TrafficManage();
  int choose;
  do {
    var x = '''
  -----CHUONG TRINH QUAN LY PHUONG TIEN GIAO THONG-----
  1. Them thong tin phuong tien
  2. Tim thong tin phuong tien theo mau sac va hang xe.
  3. Xoa thong tin phuong tien theo ma so phuong tien
  4. Tim thong tin phuong tien theo id xe.
  5. Thoat khoi chuong trinh
''';
    print(x);
    print('Nhap lua chon cua ban: ');
    choose = int.parse(stdin.readLineSync() ?? '0');
    switch (choose) {
      case 1:
        manage.import();
        break;
      case 2:
        manage.searchCar();
        break;
      case 3:
        manage.delete();
        break;
      case 4:
        manage.searchIDCar();
    }
  } while (choose < 5);
  print("Thoat khoi chuong trinh!");
}
