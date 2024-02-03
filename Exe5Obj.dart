/*Để quản lý khách hàng đến thuê phòng của một khách sạn, người ta cần các thông tin sau:
Số ngày thuê, loại phòng, thông tin cá nhân của những người thuê phòng.
Biết rằng phòng loại A có giá 500$, phòng loại B có giá 300$ và loại C có giá 100$.
Với mỗi cá nhân cần quản lý các thông tin sau: Họ tên, tuổi, số chứng minh nhân dân.
Yêu cầu 1: Hãy xây dựng lớp Nguoi để quản lý thông tin cá nhân của những người thuê phòng.
Yêu cầu 2: Xây dựng lớp KhachSan để quản lý các thông tin về các phòng trong khác sạn.
Yêu cầu 3: Xây dựng các phương thức thêm mới, xoá khách theo số chứng minh nhân dân.
Tính tiền thuê phòng cho khách(xác định khách bằng số chứng minh nhân dân)
dựa vào công thức: (số ngày thuê * giá của từng loại phòng)*/

import 'dart:io';

enum KingOfRoom { roomA, roomB, roomC }

dynamic asEnumValue(List<dynamic> enumValues, int index) {
  try {
    return enumValues[index];
  } catch (err) {
    return null;
  }
}

class User {
  String? name;
  int? old;
  int? id;
  KingOfRoom? type;

  User.name() {}

  void importUser() {
    print("Nhap ten: ");
    this.name = stdin.readLineSync();
    print("Nhap tuoi: ");
    this.old = int.parse(stdin.readLineSync() ?? '0');
    print("Nhap CMND: ");
    this.id = int.parse(stdin.readLineSync() ?? '0');
  }

  void printUser() {
    print('Ten: ${this.name}');
    print('Tuoi: ${this.old}');
    print('CMND: ${this.id}');
  }
}

class Hotel {
  int? retalDay;
  int? price;
  int? typeRoom;

  List<User> data = [];

  Hotel.name() {}

  void importHotel() {
    int n;
    print("Nhap lua chon kieu phong(0: RoomA, 1:RoomB , 2:RoomC): ");
    n = int.parse(stdin.readLineSync() ?? '0');
    KingOfRoom type = asEnumValue(KingOfRoom.values, n);
    switch (type) {
      case KingOfRoom.roomA:
        var user = User.name();
        user.importUser();
        user.type = type;
        print("Nhap so ngay thue: ");
        this.retalDay = int.parse(stdin.readLineSync() ?? '0');
        this.typeRoom = 500;
        data.add(user);
        break;
      case KingOfRoom.roomB:
        var user = User.name();
        user.importUser();
        user.type = type;
        print("Nhap so ngay thue: ");
        this.retalDay = int.parse(stdin.readLineSync() ?? '0');
        this.typeRoom = 300;
        data.add(user);
        break;
      case KingOfRoom.roomC:
        var user = User.name();
        user.importUser();
        user.type = type;
        print("Nhap so ngay thue: ");
        this.retalDay = int.parse(stdin.readLineSync() ?? '0');
        this.typeRoom = 100;
        data.add(user);
        break;
    }
    ;
  }

  void deleteUser(int n) {
    var user = data.firstWhere((element) => element.id == n);
    data.remove(user);
  }

  void priceRoom() {
    print('Nhap vao so id can tim: ');
    int n;
    n = int.parse(stdin.readLineSync() ?? '0');
    for (int i = 0; i < data.length; i++) {
      if (data[i].id == n) {
        print(
            'Gia phong cua nguoi thue co iD ${data[i].id} la: ${this.price = (this.retalDay! * this.typeRoom!)}');
      }
    }
  }
}

main() {
  var x = '''
  ---- CHON 1 TRONG CAC LUA CHON SAU ----
  1. Chon loai phong trong khach san va nhap vao thong tin nguoi thue
  2. Xoa thong tin nguoi thue bang ID
  3. Tinh tong tien thue cua nguoi thue bang ID
  4. Thoat khoi chuong trinh.
''';
  print(x);
  var hotel = Hotel.name();
  int choose;
  do {
    print("Moi nhap lua chon cua ban: ");
    choose = int.parse(stdin.readLineSync() ?? '0');
    switch (choose) {
      case 1:
        hotel.importHotel();
        break;
      case 2:
        print("Nhap vao id cua nguoi thue can xoa: ");
        int n;
        n = int.parse(stdin.readLineSync() ?? '0');
        hotel.deleteUser(n);
        break;
      case 3:
        hotel.priceRoom();
        break;
    }
    ;
  } while (choose < 4);
  print("Da thoat khoi chuong trinh");
}
