/*Để xử lý văn bản người ta xây dựng lớp VanBan  có thuộc tính riêng là một xâu ký tự.
Yêu cầu 1: Xây dựng hàm khởi tạo VanBan(), VanBan(String st).
Yêu cầu 2: Xây dựng phương thức đếm số từ của văn bản.
Yêu cầu 3: Xây dựng phương thức đếm số lượng ký tự A( không phân biệt hoa thường) của văn bản.
Yêu cầu 4: Chuẩn hoá văn bản theo tiêu chuẩn sau: Ở đầu và cuối sâu không có ký tự trống,
ở giữa sâu không có 2 hoặc nhiều hơn các ký tự khoảng trắng kiền kề nhau.*/

import 'dart:io';

class Document {
  String? randomString;

  Document(this.randomString);
  Document.init() {}

  void countChar() {
    int count = 0;
    for (int i = 0; i < this.randomString!.length; i++) {
      if (this.randomString![i] != ' ') {
        count++;
      }
    }
    print('So chu trong chuoi la: $count');
  }

  void countCharA() {
    int count = 0;
    for (int i = 0; i < this.randomString!.length; i++) {
      if (this.randomString![i] == 'A' || this.randomString![i] == 'a') {
        count++;
      }
    }
    print('So chu A trong chuoi la: $count');
  }

  void comPact() {
    this.randomString?.trim();
    print('${this.randomString}');
  }
}

main() {
  String? document;
  print("Nhap vao chuoi ky tu: ");
  document = stdin.readLineSync();
  var form = Document(document);
  form.countChar();
  form.countCharA();
  form.comPact();
}
