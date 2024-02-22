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
    listcopy.add(element);
    list.remove(element);
    print('Cac so con lai la: ${list.toString()}');
    if (list.length == 0) {
      print("Cac so can random da het. Xin moi nhap lai!");
      list.addAll(listcopy);
      listcopy.clear();
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
  3. Thoat khoi vong quay.
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
    }
  } while (choose < 3);
}
