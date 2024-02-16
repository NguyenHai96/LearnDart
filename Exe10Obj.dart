/*Để xử lý văn bản người ta xây dựng lớp VanBan  có thuộc tính riêng là một xâu ký tự.
Yêu cầu 1: Xây dựng hàm khởi tạo VanBan(), VanBan(String st).
Yêu cầu 2: Xây dựng phương thức đếm số từ của văn bản.
Yêu cầu 3: Xây dựng phương thức đếm số lượng ký tự A( không phân biệt hoa thường) của văn bản.
Yêu cầu 4: Chuẩn hoá văn bản theo tiêu chuẩn sau: Ở đầu và cuối sâu không có ký tự trống,
ở giữa sâu không có 2 hoặc nhiều hơn các ký tự khoảng trắng kiền kề nhau.*/

import 'dart:io';

class Document {
  String? letters;

  Document(this.letters);
  Document.init() {}

  void countChar() {
    int count = 0;
    if (this.letters != null) {
      for (int i = 0; i < this.letters!.length; i++) {
        if (this.letters![i] != ' ') {
          count++;
        }
      }
    }
    print('So chu trong chuoi la: $count');
  }

  void countCharA() {
    int count = 0;
    if (this.letters != null) {
      for (int i = 0; i < this.letters!.length; i++) {
        if (this.letters![i] == 'A' || this.letters![i] == 'a') {
          count++;
        }
      }
    }
    print('So chu A trong chuoi la: $count');
  }

  void trim() {
    this.letters?.trim();
    print('${this.letters}');
  }
}

main() {
  String? document;
  print("Nhap vao chuoi ky tu: ");
  document = stdin.readLineSync();
  var form = Document(document);
  form.countChar();
  form.countCharA();
  form.trim();
}
