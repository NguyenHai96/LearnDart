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

enum RoomType { roomA, roomB, roomC }

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

  User.init() {}

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

class Room {
  int? retalDay;
  RoomType? type;
  int? n;
  List<User> data = [];

  Room.init() {}
  void import() {
    print("Nhap vao so nguoi trong phong: ");
    this.n = int.parse(stdin.readLineSync() ?? '0');
    for (int i = 0; i < this.n!; i++) {
      var user = User.init();
      user.importUser();
      data.add(user);
    }
    print("Nhap so ngay thue: ");
    this.retalDay = int.parse(stdin.readLineSync() ?? '0');
  }

  int? getUserID() {
    var user = User.init();
    return user.id;
  }

  void output() {
    data.forEach((element) {
      element.printUser();
    });
    print('So ngay thue: ${this.retalDay}');
  }

  int getRoomPiece() {
    switch (type) {
      case RoomType.roomA:
        return 500;
      case RoomType.roomB:
        return 300;
      case RoomType.roomC:
        return 100;
      default:
        return 0;
    }
  }
}

class Hotel {
  List<Room> data = [];

  void importHotel() {
    int n;
    print("Nhap lua chon kieu phong(0: RoomA, 1:RoomB , 2:RoomC): ");
    n = int.parse(stdin.readLineSync() ?? '0');
    RoomType type = asEnumValue(RoomType.values, n);
    switch (type) {
      case RoomType.roomA:
        var room = Room.init();
        room.import();
        room.type = type;
        data.add(room);
        break;
      case RoomType.roomB:
        var room = Room.init();
        room.import();
        room.type = type;
        data.add(room);
        break;
      case RoomType.roomC:
        var room = Room.init();
        room.import();
        room.type = type;
        data.add(room);
        break;
    }
    ;
  }

  void deleteUser(int n) {
    var user = data.firstWhere((element) => element.getUserID() == n);
    data.remove(user);
  }

  void priceRoom() {
    print('Nhap vao loai phong can tinh tien: (0: RoomA, 1:RoomB , 2:RoomC): ');
    int n;
    n = int.parse(stdin.readLineSync() ?? '0');
    RoomType type = asEnumValue(RoomType.values, n);
    for (int i = 0; i < data.length; i++) {
      if (data[i].type == type) {
        if (data[i].retalDay != null) {
          data[i].output();
          print(
              'Gia phong thue cho loai phong ${data[i].type} la: ${data[i].retalDay! * data[i].getRoomPiece()}');
        } else {
          return null;
        }
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
  var hotel = Hotel();
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
