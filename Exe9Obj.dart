// ignore_for_file: unnecessary_null_comparison

/*Để quản lý biên lai thu tiền điện, người ta cần các thông tin sau:
Với mỗi biên lai: Thông tin về hộ sử dụng điện, chỉ số điện cũ, chỉ số mới, số tiền phải trả.
Các thông tin riêng của từng hộ gia đình sử dụng điện: Họ tên chủ hộ, số nhà, mã số công tơ điện.
Yêu cầu 1: Hãy xây dựng lớp khachHang để lưu trữu các thông tin riêng của mỗi hộ gia đình.
Yêu cầu 2: Xây dựng lớp BienLai để quản lý việc sử dụng và thanh toán tiền điện của các hộ dân.
Yêu cầu 3: Xây dựng các phương thức thêm, xoá sửa các thông tin riêng của mỗi hộ sử dụng điện.
Yêu cầu 4: Viết phương thức tính tiền điện cho mỗi hộ gia đình theo công thức: (số mới – số cũ ) * 5.*/

import 'dart:io';

class ElectricMeter {
  int? newIndex;
  int? oldIndex;

  ElectricMeter.init() {}

  void import() {
    print("Nhap vao chi so Dien cu: ");
    this.oldIndex = int.parse(stdin.readLineSync() ?? '0');
    print("Nhap vao chi so Dien moi: ");
    this.newIndex = int.parse(stdin.readLineSync() ?? '0');
  }

  void output() {
    print('Chi so dien moi: ${this.newIndex}');
    print('Chi so dien cu: ${this.oldIndex}');
  }
}

class Client {
  String? name;
  String? add;
  int? idMeter;
  var meter = ElectricMeter.init();

  Client.init() {}

  void import() {
    print("Nhap ten KH: ");
    this.name = stdin.readLineSync();
    print("Nhap dia chi KH: ");
    this.add = stdin.readLineSync();
    print("Nhap ma cong to dien: ");
    this.idMeter = int.parse(stdin.readLineSync() ?? '0');
    meter.import();
  }

  void ElectricityIndex() {
    print('So dien thang:${(meter.newIndex! - meter.oldIndex!)} ');
    print('Tien dien thang: ${(meter.newIndex! - meter.oldIndex!) * 5}');
  }

  void output() {
    print("------------------------------------");
    print('Ten KH: ${this.name}');
    print('Dia chi KH: ${this.add}');
    print('Ma Cong to dien: ${this.idMeter}');
    meter.output();
    ElectricityIndex();
  }

  void adjust() {
    int choose;
    print(
        "Nhap thong tin muon sua (1: ten chu ho, 2: dia chi khach hang, 3: Ma so cong to dien)");
    choose = int.parse(stdin.readLineSync() ?? '0');
    switch (choose) {
      case 1:
        print("Nhap lai ten chu ho: ");
        this.name = stdin.readLineSync();
      case 2:
        print("Nhap lai dia chi khach hang: ");
        this.add = stdin.readLineSync();
      case 3:
        print("Nhap lai ma cong to dien: ");
        this.idMeter = int.parse(stdin.readLineSync() ?? '0');
    }
  }
}

class Bill {
  int? price;
  List<Client> data = [];

  Bill.init() {}

  void import() {
    var client = Client.init();
    client.import();
    if (client != null) {
      data.add(client);
    }
  }

  void adjust() {
    print("Nhap ten chu ho can sua: ");
    String? name;
    name = stdin.readLineSync();
    for (int i = 0; i < data.length; i++) {
      if (data[i].name == name) {
        data[i].adjust();
      }
    }
  }

  void delete() {
    String? name;
    print("Nhap ten chu ho gia dinh can xoa: ");
    name = stdin.readLineSync();
    var user = data.firstWhere((element) => element.name == name);
    if (user != null) {
      data.remove(user);
    }
    print("Ho gia dinh da bi xoa!");
  }

  void output() {
    data.forEach((element) {
      print("------------------------------------");
      element.output();
    });
  }
}

main() {
  var bill = Bill.init();
  int choose;
  do {
    var x = '''
------------------------------------------------------------------
      -----QUAN LY BIEN LAI THU TIEN DIEN-----
      1. Nhap thong tin cua cac ho gia dinh
      2. Sua thong tin cua khach hang theo ten cua chu ho gia dinh
      3. Xoa thong tin cua khach hang theo ten cua chu ho gia dinh
      4. Xuat ra thong tin cua cac khach hang
      5. Thoat khoi chuong trinh
------------------------------------------------------------------
    ''';
    print(x);
    choose = int.parse(stdin.readLineSync() ?? '0');
    switch (choose) {
      case 1:
        bill.import();
        break;
      case 2:
        bill.adjust();
        break;
      case 3:
        bill.delete();
        break;
      case 4:
        bill.output();
        break;
    }
  } while (choose < 5);
  print("Ket thuc chuong trinh");
}
