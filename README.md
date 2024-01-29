# LearnDart

# HỌC DART
##### Ứng dụng của ngôn ngữ
+  Xây dựng ứng dụng mobile app - flutter
+  Viết các ứng dụng chạy trên máy tính Desktop app ( windown + linus + Macos)
+  Dark web.


## Khai niệm cơ bản:
 - Một số thông tin, khái niệm cần biết trước khi đi sau vào ngôn ngữ Dart.
 - Mọi thứ lưu trong biến đều là đối tượng (kể cả số, kể cả null), mọi đối tượng đều sinh ra từ định nghĩa lớp, mọi lớp đều kế thừa từ lớp cơ sở có tên Object (Giống C#).
 - Khi biến có chấp nhận mọi kiểu thì sử dụng từ khóa dynamic.
 - Dart hỗ trợ định nghĩa kiểu generic (giống C#).
 - Dart cho phép định nghĩa hàm trong hàm (lồng nhau).
 - Dart không có từ khóa public, private, protected khi khai báo phương thức, thuộc tính lớp. Nếu thuộc tính, tên lớp bắt đầu bằng _ thì hiểu đó là private.
 - Các định danh (tên biến, tên hàm, tên lớp ...) bắt đầu bằng chữ(a-zA-Z) hoặc _, theo sau là chuỗi chữ có thể kế hợp với số.


## Quy tắc trình bày code:
 - Những quy tắc này không bắt buộc bạn phải tuân theo, nhưng nếu áp dụng code sẽ trở nên sáng sủa, dễ đọc và thống nhất.
 - Nên đặt tên kiểu UpperCamelCase cho lớp, enums, tham số(chữ đầu của từ là chữ in: HttpRequest ).
 - Tên file, thư viện viết chữ thường, các từ nối với nhau bởi _: abc_xyz.dart.
 - Biến, hằng, object đặt tên kiểu lowerCamelCase, chữ đầu các từ viết IN, trừ từ đầu tiên (defaultTimeout).
 - Cố gắng viết tắt khi tên trên 2 từ, lấy ký đầu viết IN để tạo chữ viết tắt (IOStream ~ InputOutputStream).

# Biến kiểu dữ liệu và hằng số trong Dart
## Khai báo và sử dụng biến với var, hằng số const, final các kiểu dữ liệu trong Dart

### Khai báo biến, khởi tạo biến
Biến để lưu các đối tượng khi ứng dụng hoạt động, để tạo ra biến dùng từ khóa var với cú pháp như sau:

main() {
    
    // Khai báo biến a, khởi tạo nó lưu một chuỗi
    // (do vậy a có kiểu String, nó chỉ lưu chuỗi)
    var a = "Learn Dart";

    a = "Learn Dart 2";   // Gán chuỗi khác
    a = 100;              // Lỗi vì gán số vào a

    // Khai báo và không khởi tạo
    // biến b sẽ có giá trị null - lúc này
    // kiểu của b tùy thuộc vào giá trị gán vào nó
    var b;
    b = 100;            // Gán số vào b
    b = "aaa";          // Gán chuỗi vào b
}

Bạn cũng có thể khai báo và chỉ định kiểu dữ liệu cụ thể cho nó luôn, khi chỉ định kiểu cụ thể mỗi khi gán dữ liệu vào biến thì giá trị phải cùng kiểu

String  s     = 'Chuỗi ký tự'; // Khai báo biến chuỗi
double  d     = 1.1234;        // khai báo biến số thực
int     i     = 1;             // biến số nguyên
bool    found = true;          // biến logic

Trong trường hợp bạn sử dụng biến mà biến đó không xét đến kiểu (chấp nhận gán vào nó nhiều loại kiểu) thì dùng từ khóa dynamic
dynamic dyn = 123;             // Khởi tạo là số int
        dyn = "Dynamic";               // Gán chuỗi
        dyn = 1.12345;                 // Gán số double


### Hằng số khai báo và sử dụng
Hằng số lưu giá trị mà không thể thay đổi, sử dụng từ khóa const hoặc final để tạo ra hằng số.

##### Tạo hằng số const
 - const ten_hang_s0 = biểu_thức_giá_trị;

 //Ví dụ
 const dow_0     = 'Sunday';
 const dow_1     = 'Monday';
 const minutes   = 24 * 60;
 
 Cách khai bao trên gọi là hằng số lúc biên dịch, giá trị của nó phải là cụ thể ngay lúc bạn viết code.

##### Tạo hằng số final
Thực ra đây giống như khai báo biến, nhưng biến final chỉ được gán một lần duy nhất, gán lần thứ 2 sẽ lỗi (trước khi sử dụng phải có 1 lần gán). Nó gọi là hằng số lúc chạy, giá trị hằng số này có thể khác nhau mỗi lần chạy

- Cú pháp như sau:
final name_1          = biểu_thức_giá_trị;
final String name_2   = biểu_thức_giá_trị; //Chỉ rõ luôn kiểu của hằng
var so_ngau_nhien = Random(1000).nextInt(500);

//Tạo hằng số:  
 final a = so_ngau_nhien * 2;

Như ví dụ trên, tạo ra hàng số a. Hằng số này sau khi khởi tạo thì không thay đổi nữa. Vấn đề hằng số này được khởi tạo bằng một giá trị ngẫu nhiên sinh ra bởi hàm Random, vậy mỗi lần chạy ứng dụng hằng số này có thể có giá trị khác nhau. Nó khác với const là cố định ngay từ khi viết code (hằng số biên dịch).

 - Ví dụ sau sẽ bị lỗi

var so_ngau_nhien = Random(1000).nextInt(500);
const a = so_ngau_nhien * 2;

test.dart:7:13: Error: Not a constant expression.
Lỗi vì bạn không thể biết a bằng bao nhiêu khi đọc code

### Các kiểu dữ liệu trong Dart, phép toán cơ bản
#### Dart đang hỗ trợ các nhóm kiểu dữ liệu: Số, Chuỗi, Logic, Mảng, symbol, Runes (chuỗi Unicode 32-bit)

##### Kiểu	Mô tả
- int	Biểu diễn các giá trị số nguyên
  int numint = 100;
  Đổi chữ thành số nguyên
  int numint = int.parse("120");
- double	Biểu diễn giá trị số thực 64bit
  double d1 = 100; //100.0
  double d2 = 0.1234;
  var    d3 = 12.123;
  Đổi chuỗi thành số thực
  var abc = double.parse("123.123");
- Cả số nguyên và số thực có các phép toán để tạo thành biểu thức là (cộng,trừ,nhân,chia)
  + - * /
  double c = (a + b) / (a-b);
  Trên các đối tượng số này có các phương thức để chuyển đổi kiểu toString(), toInt(), toDouble()

  double a = 10.10;
  int    b = a.toInt();
  String c = (a + b).toString();
- string	Biểu diễn chuỗi ký tự Unicode(UTF-16). Nó được nhập vào trong cặp nháy đơn '' hoặc nháy kép "". Dùng ký hiệu \", \' để biểu diễn ký tự ', " trong chuỗi
    String a = 'Chuỗi ký tự \'\' (nháy đơn)';  // Chuỗi ký tự '' (nháy đơn)
    String b = "Chuỗi ký tự \"\" (nháy kép)";  // Chuỗi ký tự "" (nháy kép)
    Để nối các chuỗi lại với nhau dùng toán tử +, kiểm tra hai chuỗi giống nhau không dùng ==
    String s1 = "S1";
    String s2 = "S2";
    String s3 = s2 + '_' + s1;
    print(s3); //S1_S2
    Muốn nhập chuỗi trên nhiều dòng, dùng cú pháp sau (các dòng nằm giữa cặp ... hoặc ***);
    String s1 = '''
    Các dòng
    chữ trong chuỗi s1
    ''';
    print(s1);
    //Hoặc
    String s2 = """
    Các dòng
    chữ trong chuỗi s2
    """;
    print(s2);
- Có thể chèn một biến hoặc một biểu thức vào chuỗi bằng cách ký hiệu $tên_biến, ${biểu thức giá trị}
  var a = 10;
  var b = 20;

  String kq = "Hai số $a, $b có tổng ${a + b}";
  print(kq); //Hai số 10, 20 có tổng 30
- bool	Biểu diễn logic đúng / sai với hai giá trị true và false.
  bool found = true;
  
  if (found) {
      //Do something
  }
- Mảng	Còn gọi là danh sách list, nó lưu tập hợp các dữ liệu, nó giống khái niệm này của JavaScript. Khởi tạo một mảng dùng ký hiệu [], giá trị các phần tử liệt kê cách nhau bởi ,. Các phần tử mảng có chỉ số từ 0, để truy câp đến phần tử nào dùng ký hiệu [chỉ_sổ]
  var dow = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];
  print(dow.length);          //Số phần tử trong mảng
  print(dow[0]);              //Lấy phần từ đầu tiên, chỉ số 0
  dow[6] = 'Chủ nhật';        //Gán giá trị mới cho phần tử chỉ số 6
  print(dow[6]);
      //Kết quả
      7
      T2
      Chủ nhật
- Map	Cũng lưu tập hợp các giá trị (còn gọi là mảng kết hợp), thay vì sử dụng chỉ số từ 0 để tham chiếu đến phần tử, chỉ số của Map tự do đánh. Tức là mỗi phần tử trong Map lưu theo cặp key:value, dùng ký hiệu {} để khởi tạo Map hoặc khởi tạo bằng Map(); Truy cập đến phần tử Map dùng ký hiệu chấm .key
   var dow = {
       'T2' : 'Thứ 2',
       'T3' : 'Thứ 3',
       'CN' : 'Chủ Nhật'
   };

   print(dow.length);                     //Số phần tử
   print(dow['T2']);                      //Truy cập phần tử chỉ số T2
   dow.putIfAbsent('T4', () => 'Thứ 4');  //Thêm phần tử mới nếu chưa có
   
   //Cũng có thể tạo ra Map bằng
   //var dow = new Map();
