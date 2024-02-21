import 'dart:io';
import 'dart:math';

class RandomNumber {
  List<int> list = [];
  List<int> listcopy = [];

  void import() {
    print('Nhap 1 so vao vong quay: ');
    int number;
    number = int.parse(stdin.readLineSync() ?? '0');
    list.add(number);
  }

  void randomChoose() {
    final random = new Random();
    var element = list[random.nextInt(list.length)];
    print('------------');
    print('So duoc chon la: $element');
    bool condition =
        listcopy.where((number) => number == element).toList().isEmpty;
    if (condition) {
      listcopy.add(element);
    }
    if (list.length > 0) {
      list.remove(element);
      print('Cac so con lai la: ${list.toString()}');
    }
    if (list.length == 0) {
      print("Cac so can random da het. Xin moi nhap lai!");
    }
  }

  void assignNumber() {
    for (int i = 0; i < listcopy.length; i++) {
      bool condition =
          list.where((number) => number == listcopy[i]).toList().isEmpty;
      if (condition) {
        list.add(listcopy[i]);
      }
    }
  }
}

main() {
  var random = RandomNumber();
  int choose;
  do {
    var x = '''
  -----Vong quay-----
  1. Them phan tu.
  2. Random ra phan tu.
  3. Them lai tat ca phan tu da random.
  ''';
    print(x);
    print("Nhap lua chon cua ban:");
    choose = int.parse(stdin.readLineSync() ?? '0');
    switch (choose) {
      case 1:
        random.import();
        break;
      case 2:
        random.randomChoose();
        break;
      case 3:
        random.assignNumber();
    }
  } while (choose < 4);
}
