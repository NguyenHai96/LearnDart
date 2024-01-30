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
- **Mảng	Còn gọi là danh sách list, nó lưu tập hợp các dữ liệu, nó giống khái niệm này của JavaScript. Khởi tạo một mảng dùng ký hiệu [], giá trị các phần tử liệt kê cách nhau bởi ,. Các phần tử mảng có chỉ số từ 0, để truy câp đến phần tử nào dùng ký hiệu [chỉ_sổ]**
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


## Toán tử số học trong Dart
### Toán tử	Ý nghĩa
+	Phép cộng. 5 + 6 kết quả 11
-	Phép trừ. 5 - 6 kết quả -1
*	Phép nhân
var a = 5;
var b = 6;
print(a * b); //30
/	Phép chia. 5 / 6 kết quả 0.8333333333333334
~/	Phép chia lấy phần nguyên. 6 ~/ 4 kết quả 1
%	Phép chia modulo (lấy phần dư) 6 % 4 kết quả 2
-biểu_thức	Đổi dấu kết quả biểu thức -(5 - 6) kết quả 1
++var	var = var + 1. Thêm 1 vào var, trong biểu thức việc tăng này được thực hiện trước.
var a = 5;
var c = 10 + (++a);  //a tăng thêm 1, a thành 6
print(a);            //6
print(c);            //16
var++	var = var + 1. Thêm 1 vào var, trong biểu thức việc tăng này được thực hiện sau.
var a = 5;
var c = 10 + (++a);  //Tính c với a = 5, sau đó mới tăng a
print(a);            //6
print(c);            //15
--var	var = var - 1. Bớt var đi 1, việc bớt này thực hiện trước trong biểu thức.
var--	var = var - 1. Bớt var đi 1, việc bớt này thực hiện sau trong biểu thức.


- Phép gán trong Dart
Phép gán là =, để thực hiện gán giá trị biểu thức bên phải vào biến ở phía bên trái toán tử.

biến = biểu_thức;
var a = 1 + 2 + 3 + 4;
Phép toán gán có trường hợp viết phức tạp kết hợp cùng một toán tử khác phía trước dạng toán_tử_trước= như +=, -=, *=, /* ... Điều này có nghĩa là biến và biểu thức bên phải thực hiện toán tử phía trước, giá trị được bao nhiêu gán vào biến.

a *= 5;  // Tương đương a = a * 5;
a +=5;   // Tương đương a = a + 5;
a / 5;   // Tương đương a = a / 5;
Toán tử so sánh trong Dart
Các toán tử này thực hiện trên biểu thức logic, kết quả là true hoặc false

Toán tử	Ý nghĩa
==	So sánh bằng 5 == 5 kết quả true, 5 == 6 kết quả false
!=	So sánh khác 5 != 5 kết quả false, 5 != 6 kết quả true
>	So sánh lớn hơn 5 > 5 kết quả false, 6 > 5 kết quả true
<	So sánh nhỏ hơn 5 < 5 kết quả false, 5 > 6 kết quả true
<=	So sánh nhỏ hơn hoặc bằng
>=	So sánh lớn hơn hoặc bằng
Toán tử logic Dart
Toán tử	Ý nghĩa
||	Phép logic hoặc, a || b kết quả true nếu a hoặc b là true
&&	Phép logic và, a && b kết quả true nếu a và b đều true
!biểu_thức	Phép phủ định !a nếu a là true thì kết quả phép toán là false
Biểu thức điều kiện
biểu_thức_điều_kiện ? biểu_thức_1 : biểu_thức_2
Biểu thức tổng hợp trên kết hợp từ ba biểu thức con. Nếu điều kiện là đúng thì giá trị tính theo biểu_thức_1, ngược lại là biểu_thức_2

var a = 4;
var b = 10;
var d = (a > b) ? a : b;
//Kết quả d = 10
biểu_thức_1 ?? biểu_thức_2
Biểu thức kết hợp với ??, nếu biểu_thức_1 khác null thì lấy biểu_thức_1, ngược lại lấy giá trị từ biểu_thức_2

Một số toán tử trên lớp, đối tượng
Toán tử	Ý nghĩa
[]	Truy cập phần tử mảng
.	Truy cập phương thức, thuộc tính đối tượng
.	Truy cập phương thức, thuộc tính đối tượng khi đối tượng đó khác null myobject?.method();
as	Chuyển kiểu: (var as MyClass)
is	Kiểm tra kiểu: (var is MyClass)
is!	Kiểm tra kiểu: (var is! MyClass)

## Các cấu trúc rẽ nhánh if switch và vòng lặp for while trong Dart
Tìm hiểu các cấu trúc lệnh như rẽ nhánh với lệnh if else, swich case các loại vòng lặp fore, while với ngôn ngữ lập trình Dart
if - else switch for do ... while while continue - break Assert

#### Câu lệnh if - else
Dạng 1, thực hiện khối lệnh khi biểu thức logic kiểm tra là true

if (biểu_thức) {
    //Viết lệnh chạy khi biểu_thức là true
}
Dạng 2, nếu điều kiện là đúng thực hiện khối lệnh 1, nếu sai thực hiện khối lệnh 2

if (biểu_thức) {
    //Viết lệnh chạy khi biểu_thức là true
} else {
    //Viết lệnh chạy khi biểu thức là false
}
//CÓ THỂ VIẾT NHIỀU LỆNH IF
if (biểu_thức_1) {
    //..Các câu lệnh
} else if (biểu_thức_2) {
    //Các câu lệnh
} else if (biểu_thức_3) {
    //Các câu lệnh
} else {
    //Các câu lệnh
}
var a = 12;
if (a < 10) {
    print('a nhỏ hơn 10');
} else if (a < 8) {
    print('a nhỏ hơn 8');
}
else {
    print('a lớn hơn hoặc bằng 10');
}
#### Câu lệnh rẽ nhánh switch
Khi cần rẽ nhiều nhánh, thay vì dùng nhiều lệnh if else ở trên thì có thể dùng switch với cú pháp

switch (biểu_thức) {
    case : giá_trị_1
      // Khối lệnh
      break;
    case : giá_trị_2
      //Khối lệnh
    break;

    default:
      //Khối lệnh mặc định
}
Giá trị của biểu_thức được so sánh với các giá trị giá_trị_1, giá_trị_2 ... nếu bằng cái nào thì thi hành khối lệnh bắt đầu tử điểm đó cho đến khi gặp break;

Nếu có khối default thì khi không có giá trị nào phù hợp sẽ thi hành khối này.

var t = 0;
switch(t) {
    case 0:
      print('Chủ Nhật');
    break;

    case 1:
      print('Thứ 2');
    break;

    default:
      print('Không có giá trị nào');
}
#### Vòng lặp for
Cú pháp:

for (statement1; statement2; statement3) {
    Khối lệnh thi hành
}
statement1 : lệnh thi hành trước khi vòng lặp for bắt đầu
statement2 : điều kiện kiểm tra trước mỗi lần thi hành khối lệnh for (true thì khối lệnh sẽ thi hành, false sẽ khối for sẽ không thi hành - thoát lặp)
statement3 : thi hành sau mỗi lần một vòng hoàn thành
Ví dụ:

for (var i=1; i<=5; i++) {
    print(i);
}
//In ra
    1
    2
    3
    4
    5
Có thể bỏ qua statement1 (vẫn giữ lại dấu ;)

var i = 1;
for (; i<=5; i++) {
    print(i);
}

//In ra
    1
    2
    3
    4
    5
Tương tự bạn có thể bỏ qua statement3 và statement2 (vẫn giữ ;), lưu ý bạn cũng có thể sử dụng lệnh break; để thoát vòng lặp.

var k = 0;
for (;;k+=2) {
  if (k>10) break;
  print(k);
}
    //In ra
    2
    4
    6
    8
    10
#### Vòng lặp while trong Dart
Thi hành khối lệnh khi mà điều kiện kiểm tra vẫn là true

while (điều-kiện) {
   //Khối lệnh
}
Đầu tiên nó kiểm tra điều kiện, nếu true sẽ thi hành khối lệnh. Đến cuỗi khối lại kiểm tra điều kiện, nếu điều kiện vẫn là true thì lại tiếp tục thì hành vòng mới của khối lệnh.

Ví dụ

var i=0;
while (i<=5) {
    print(i);
    i++;
}
//In ra
    0
    1
    2
    3
    4
    5
Lưu ý về việc sau một số vòng thì điều kiện phải là false nếu không vòng lặp sẽ lặp lại vô tận.

#### Vòng lặp do while trong Dart
Giống với vòng lặp while nhưng khối lệnh thi hành luôn mà không kiểm tra điều kiện trước, khi khối lệnh thi hành xong mới kiểm tra điều kiện để xem có lặp lại hay không

Cú pháp

do {
   //Khối lệnh
}
while (condition);
Ví dụ

var i=20;
do {
    print(i);
    i++;
}
while (i<=25);

    //In ra
    20
    21
    22
    23
    24
    25
Vòng lặp do ... while khối lệnh luôn được thi hành ít nhất một lần

### Lệnh continue và break
Trong vòng lặp khi gặp continue; nó sẽ bỏ qua các lệnh còn lại và khởi tạo vòng lặp mới luôn. Còn nếu gặp break; thì bỏ qua các lệnh còn lại đồng thời thoát khỏi vòng lặp.

for (i = 0; i <= 70000; i++) {
   if (i == 5) {
      continue;                         //Khởi tạo vòng lặp mới luôn
   }
   print(i);
   if (i >=7) {
        break;                          //Thoát lặp nếu i >=7
    }
}
//In ra các số: (bỏ qua 5)
0
1
2
3
4
6
7
#### Lệnh continue còn dùng để nhảy đến một khối lệnh có nhãn bằng cú pháp

 continue nhãn_khối_lệnh;
 Lệnh break còn dùng để hủy thi hành khối lệnh bên ngoài có nhãn, với cú pháp:

  break nhãn_khối_lệnh_ngoài;
 Phần nói về các đối tượng có kiểu liệt kê được (ví dụ như mảng, danh sách ...), còn có các lệnh duyệt qua từng phần tử liệt kê được đó với các lệnh for ... in, for ... of.

#### Test với Assert
Dart cung cấp lệnh Assert(biểu_thức_logic); để khi chạy mà biểu thức logic sai sẽ dừng chương trình ở đó. Assert là cách để kiểm tra một biểu thức, vấn đề là nó không có ảnh hưởng gì khi chạy ở chế độ product nó chỉ tác dụng khi phát triển (Chạy debug Ctrl + F5 trong VS)

// Đảm bảo một đối tượng khác null
assert(myobject != null);

// Đảm bảo số lớn hơn 100
assert(number > 100);

## Xây dựng hàm trong Dart
**Tìm hiểu cú pháp khai báo hàm, tham số tùy chọn, sử dụng hàm nặc danh lambda - closure trong ngôn ngữ lập trinh Dart**

- **Hàm trong Dart**
Hàm là một khối lệnh thực hiện một tác vụ gì đó, khối lệnh này được dùng nhiều lần nên gom chúng tại thành một hàm. Trong Dart mọi thứ đều là đối tượng nên hàm cũng là một đối tượng (kế thừa Function).

Đây là một khai báo hàm

double tinhtong(var a, double b, double c) {
  return a + b + c;
}
//HOẶC
double tinhtong(var a, double b, double c) {
  return a + b + c;
}

//GỌI HÀM
var x = tinhtong(1,2,3);
print(x); //6.0
Như vậy khi khai báo hàm ta có thể có các thành phần sau:

Chỉ ra kiểu giá trị trả về của hàm (ví dụ double), giá trị trả về bằng biểu thức của lệnh return. Với Dart thiếu việc khai báo kiểu giá trị trả về hàm vẫn hoạt động tốt. Còn khi có chỉ rõ kiểu trả về thì giá trị trong biểu thức return phái trùng với kiểu khai báo hàm.
Tham số được liệt kê sau tên hàm trong cặp () như trên có ba tham số a,b,c
Hàm kết thúc khi chạy hết khối lệnh hoặc gặp lệnh return, giá trị hàm là biểu thức sau return, nếu thiếu giá trị hàm sẽ là null
Gọi hàm thì viết tên hàm và truyền đúng tham số theo thứ tự yêu khai báo
Giá trị tham số mặc định của hàm
Nếu bạn muốn tham số có giá trị mặc định, nghĩa là khi gọi hàm mà thiếu giá trị cho tham số đó, thì nó sẽ nhận mặc định. Ví dụ

double tinhtong(var a, {double b:1, double c:2}) {
  return a + b + c;
}

var v1 = tinhtong(1);
print(v1); //4.0

var v2 = tinhtong(1, c:10);
print(v2);  //12.0

var v3 = tinhtong(1, c:2, b:10);
print(v3); //13.0

Hàm trên tham số b mặc định là 1, c mặc định là 2. Nếu không chỉ ra tham số này khi gọi nó sẽ dùng mặc định, còn muốn chỉ ra khi gọi thì truyền theo cú pháp tên_tham_số:giá_trị, như ví dụ trên tinhtong(1, c:2, b:10)

 - **Hàm với tham số tùy chọn**
Các tham số tùy chọn của hàm có nghĩa là khi họi hàm có sử dụng hoặc không. Các tham số tùy chọn gom lại trong [], nếu khi gọi hàm không có tham số này thì nó nhận giá trị null

double tinhtong(var a, [double b, double c]) {
   var tong = a;
   if (b != null)
    tong += a;

   tong += (c!=null) ?  c: 0;
}

print(tinhtong(1));       //1.0
print(tinhtong(1,2));     //3.0;
print(tinhtong(1,2,3));   //6.0;

- **Hàm với kỹ hiệu mũi tên =>**
Với những hàm chỉ có một biểu thức trả về luôn, thì có thể có cách viết ngắn gọn bằng ký hiệu mũi tên

  double tinhtong(var a, var b) {
    return a + b;
  }

  // Có thể viết lại thành

  double tinhtong(var a, var b) => a + b;
- **Hàm ẩn danh - lambda - closure**
Hầu hết khai báo hàm là có tên hàm, tuy nhiên trong nhiều ngữ cảnh khai báo hàm và không dùng đến tên, hàm đó gọi là hàm ẩn danh còn gọi là lambda hoặc closure
Tạo ra hàm ẩn danh thì làm như hàm có tên bình thường, chỉ có điều phần kiểu trả về và tên bị thiếu.

(var a, var b) {
    return a + b;
};

//Có thể dùng ký hiệu mũi tên  () => {}
(var a, var b) => {
    return a + b;
}

//Nếu chỉ có 1 biểu thức trả về như trên có thể viết gọn hơn
(var a, var b) => return a + b;
Khai báo trên là hàm ẩn danh, nhưng để sử dụng nó thì ra lệnh cho nó chạy luôn hoặc gán nó vào một biến rồi dùng biến gọi hàm.

//Khai báo xong chạy luôn
var x = (var a, var b) {
    return a + b;
}(5,6);

print(x);                   //11
//Gán hàm ẩn danh vào biến ham, rồi dùng nó chạy
var ham = (var a, var b) {
    return a + b;
};

print(ham(10,11));          //21
Hàm ẩn danh rất tiện dụng để làm tham số (callback) trong các hàm khác, thậm chí khai báo luôn một ẩn danh ở tham số hàm

f1(var a, var b, var printmessage) {
     var c = a + b;
     printmessage(c);
}


f1(1, 2, (x) { print('Tổng là: $x');});         //Tổng là: 3
f1(1, 2, (z) => print('SUM = $z'));             //SUM = 3

## Lớp trong Dart khai báo và sử dụng class
Cách tạo ra một lớp class, các loại phương thức khởi tạo, hàm setter getter. Tìm hiểu tính kể thừa, interface, mixin trong ngôn ngữ lập trình Dart
### Class trong Dart
Class để tạo ra các đối tượng, với Dart mọi thứ kể cả số đều là đối tượng, các đối tượng đề kế thừa từ class Object

Trong một class nó có thể có các thành phần:

Các phương thức khởi tạo - Hàm được gọi khi tạo ra một đối tượng mới từ class
Các biến lưu dữ liệu của đối tượng - gọi là các trường - các thuộc tính
Các hàm - gọi là các thành viên hàm - các phương thức
Các hàm đặc biệt gọi khi thực hiện gán thuộc tính / truy cập thuộc tính - hầm setter/getter
Từ lớp đã có khởi tạo đối tượng bằng cách gọi hàm khởi tạo của nó với toán tử new, sau khi có đối tượng thì truy cập vào các thành viên (phương thức, thuộc tính) bằng ký hiệu chấm . như object.phuongthuc();

Khai báo một lớp thì dùng từ khóa class, ví dụ sau khai báo một lớp:

class Product {
  //Khai báo các thuộc tính
  String manufacture = '';
  String name = '';
  var    price;
  int    quantity;

  //Khai báo hàm khởi tạo
  Product(var price, {int quantity:0}) {
    this.price    = price;
    this.quantity = quantity;
  }


  //Khai báo các phương thức
  calulateTotal() {
    return this.price * this.quantity;
  }

  showTotal() {
    var tong = this.calulateTotal();
    print("Tổng số tiền là: $tong");
  }
}

Sử dụng

var product = new Product(600, quantity: 1);
product.showTotal();

product.quantity = 2;
product.showTotal();

//KẾT QUẢ CHẠY
Tổng số tiền là: 600
Tổng số tiền là: 1200
Như vậy ta thấy khai báo thuộc tính, phương thức trong lớp tương tự như khai báo biến và hàm thông thường chỉ có điều nó nằm trong class

Để truy cập vào một phương thức, thuộc tính dùng ký kiệu chấm . ví dụ product.quantity = 2, product.showTotal()


Trong phương thức của lớp, để tham khảo đến đối tượng của lớp dùng từ khóa this, ví dụ trong hàm calulateTotal() có đoạn return this.price * this.quantity

Khi đã có lớp, việc tạo ra đối tượng lớp thì dùng toán tử new, var product = new Product(600, quantity: 1) hoặc không cần toán tử new vẫn được chấp nhận product = Product(600, quantity: 1)

Khi khởi tạo như vậy, nó sẽ gọi đến hàm có cùng tên với lớp, gọi là hàm khởi tạo - để thiết lập các thông tin cho lớp, ở ví dụ trên có một hàm khởi tạo Product(var price, {int quantity:0}), tuy nhiên bạn có thể tạo ra nhiều hàm tạo có tên gọi theo nguyên tắc như sau:
**Hàm khởi tạo có tên**
Giả sử sẽ tạo ra hàm tạo tên iphone để khởi tạo một loại sản phẩm cụ thể, thì khai báo trong lớp như sau:

class Product {
  // ...
  Product.iphone(var price, {int quantity:0}) {
    this.price       = price;
    this.quantity    = quantity;
    this.manufacture = 'Apple';
  }
  // ...
}
Nếu vậy bạn có thể khởi tạo bằng hàm tạo này

var product = Product.iphone(700, quantity: 2);
**Phương thức tĩnh**
Các phương thức (hàm) trong lớp chỉ truy cập được trên một đối tượng cụ thể triển khai từ lớp (biến product), nhưng bạn có thể chỉ định phương thức là tĩnh bằng từ khóa static, thì hàm không cần đối tượng triển khai từ lớp để hoạt động mà có thể gọi hàm đó thông qua tên lớp. Ví dụ khai báo phương thức có tên showListStore() là phương thức tĩnh.

class Product {
  // ...
  static showListStore() {
    print('Store 1 ...');
    print('Store 2 ...');
  }
  // ...
}
Như vậy bất kỳ đâu cũng có thể gọi đến phương thức này mà không cần khởi tạo đối tượng. Chỉ cần tên lớp để gọi (cần nhớ là hàm này thuộc về lớp chứ không thuộc về đối tượng triển khai từ lớp)

Product.showListStore();

#### ***Hàm Setter/Getter***


Ta có thể xây dựng hàm đặc biệt gọi mà có thể truy cập nó giống phương thức thì nó thi hành (Setter gọi khi thực hiện gán, Getter gọi khi truy cập). Sử dụng từ khóa get trước một hàm không có tham số thì hàm đó trở thành Getter, sử dụng từ khóa get trước hàm 1 tham số thì đó là hàm Getter

Ví dụ có thêm vào lớp Product hàm Getter và Setter đều có tên là nameProduct

class Product {
  // ...

  //getter
  get nameProduct {
    return this.name;
  }

  //Hàm setter
  set nameProduct(name) {
    this.name = name;
    switch (this.name) {
      case 'Iphone 6':
        this.manufacture = "Apple";
      break;

      case 'Galaxy S6':
        this.manufacture = 'Samsung';
      break;

      default: this.manufacture = '';

    }
  }
  // ...
}
Sau khi có Getter/Setter thì truy cập giống như thuộc tính

product.nameProduct = "Galaxy S6";      //Gọi đến hàm Setter - nameProduct
var info = product.nameProduct;         //Gọi đến Getter


**Tính kế thừa trong lớp**


Từ một lớp đã có, bạn có thể tạo ra một định nghĩa lớp mới, lớp mới đó gọi là lớp kế thừa - lớp con có luôn các thuộc tính, phương thức từ lớp mà nó kế thừa (gọi là lớp cha).

Để xây dựng một lớp mới kế thừa lớp đã có dùng tới từ khóa extends, ví dụ từ lớp Product xây dựng thêm lớp Table có thêm thuộc tính mô tả chiều dài, chiều rộng của sản phẩm.

class Table extends Product {
  double length = 0;
  double width   = 0;
  Table(var giatien) : super(giatien, quantity:1) {
    //Mã khởi tạo tại lớp con, sau khi hàm tạo lớp cha chạy xong
    this.name = "Bàn Ăn";
  }
}
Khởi tạo tại lớp con và sự truy cập đến lớp cha
Lớp con nói chung sẽ có những thuộc tính và phương thức kế thừa từ lớp cha, nên từ lớp con bằng từ khóa this có thể truy cập đến những thành phần này. Tuy nhiên có những phương thức mà lớp con sẽ định nghĩa lại mà vẫn giữ tên cũ (quá tải) lúc này this sẽ sử dụng phương thức định nghĩa lại, tuy nhiên phiên bản ở lớp cha vẫn còn đó, lúc này nếu muốn truy cập đến phiên bản định nghĩa bởi lớp cha sẽ dùng ký hiệu super thay cho this (xem thêm phần quá tải hàm ở dưới).

Hàm khởi tạo ở lớp con, nói chung bắt buộc cũng phải gọi một hàm khởi tạo nào đó của lớp cha. Để làm được điều đó sau hàm khởi tạo của lớp con chỉ rõ hàm tạo nào cả lớp cha sẽ gọi sau dấu :
Ở ví dụ trên chính là đoạn supper(giatien, quantity:1) tương đương với hàm khởi tạo Product(giatien, quantity:1)

Trở lại lớp Table trên, khi tạo đối tượng từ lớp

var table = new Table(500);
Hàm tạo thi hành nó đã gọi đến hàm tạo của lớp cha Product rồi đến các code của chính hàm tạo Table


***Nạp chồng phương thức / toán tử***

Bạn có thể tạo ra phiên bản mới của một phương thức đã có trên lớp cha, và từ đây đối tượng sẽ sử dụng phương thức mới được định nghĩa, để làm điều đó ở lớp con tạo lại phương thức với chỉ thị @override - nạp chồng phương thức

Ví dụ, ta sẽ nạp chồng phương thức showTotal()

class Table extends Product {
  // ...
  @override
  showTotal() {
      print('Sản phẩm:' + this.name);
      //gọi đến phương thức ở lớp cha
      super.showTotal();

    }
 // ...
}
Ở phiên bản ở lớp con, do có nhu cầu sử dụng lại phương thức của lớp cha nên nó có gọi đến phương thức cũ bằng super.showTotal()

Như vậy các đối tượng triển khai từ lớp Table đã có một phiên bản riêng của phương thức showTable, mặc định nó sẽ gọi đến phương thức mới này (Kể các các phương thức lớp cha cũng sẽ tự động gọi đến phương thức mới định nghĩa này).

var table = new Table(600);
table.showTotal();

//Kết quả chạy
var table = new Table(600);
table.showTotal();
Đối với các toán tử như +, -, *, [] ... cũng có thể nạp chồng như trên.

Ví dụ định nghĩa toán tử +

Product operator + (Product p) => new Product(this.quantity + p.quantity);

***Lớp trừu tượng***

Lớp trừu tượng là lớp không dùng trực tiếp để tạo ra đối tượng được, nó chỉ được kế thừa từ lớp khác. Phương thức nào trong lớp trừu tượng chỉ khai báo tên hàm, thì phương thức đó gọi là phương thức trừu tượng, lớp kế thừa bắt buộc phải định nghĩa nội dung hàm này. Sau đây là tạo ra lớp tượng A với từ khóa abstract

abstract class A {
  //Khai báo các thuộc tính
  var name = 'My Abstract Class';
  //Khai báo các phương thức nếu cần

  //Khai báo phương thức trừu tượng (chỉ có tên)
  void displayInfomation();
}
Lớp này không thể dùng để tạo ra đối tượng, nhưng nó được kế thừa bởi lớp khác. Lớp con kế thừa bắt buộc phải định nghĩa nội dung cho phương thức trừu tượng bằng cách nạp chồng (@override). Ví dụ khai báo lớp B kế thừa lớp trừu tượng A

class B extends A {
  @override
  void displayInfomation() {
     print(this.name);
  }
}
//Áp dụng
var i = new B();
i.displayInfomation();

//Kết quả chạy
My Abstract Class

***Tìm hiểu về interface***

Interface - giao diện - là khái niệm quen thuộc trong các ngôn ngữ lập trình hướng tối tượng, với Dart mặc định mọi lớp đều là interface lớp lớp đó được triển khai bởi lớp khác bằng từ khóa implements

Khi một lớp được coi là giao diện thì lớp triển khai nó phải định nghĩa lại mọi phương thức, thuộc tính có trong giao diện

Ví dụ xây dựng lớp C triển khai từ lớp B bằng implements vậy B sẽ là interface và trong C bắt buộc phải định nghĩa lại mọi thứ trong B

class C implements B {
  @override
  String name;

  @override
  void displayInfomation() {
      // ...
  }
}
Mục đích sử dụng giao diện là để đảm báo các lớp có cùng giao diện sẽ có các API giống nhau.

***Sử dụng Mixin***

Với Dart thì Mixin là một lớp, nó không được sử dụng trực tiếp để tạo ra đối tượng, một Mixin chứa các phương thức, thuộc tính dùng để gộp vào một lớp khác.

Ví dụ ta có một Mixin tên là M thì khi khai báo lớp C ở trên muốn gộp những gì có ở M vào dùng từ khóa with (mang ý nghĩa gộp code chứ không mang ý nghĩa kế thừa) với cú pháp như sau

mixin M {
  var var1 = null;
  showSomething()
  {
    print('Print message ...');
  }
}

class C extends B with M {
  @override
  String name;

  @override
  void displayInfomation() {
   }
}


***Một số lưu ý bổ sung về Class***

**Lớp Object**

Đây là lớp cơ sở của Dart, mặc định mọi lớp, mọi hàm ... kể cả lớp, hàm do bạn định nghĩa đều mở rộng từ lớp này. Như vậy mọi lớp đều có một số phương thức, thuộc tính chung là:

hashCode thuộc tính chứa mã hash của đối tượng
toString() trả về chuỗi mô tả đối tượng
== toán tử so sánh theo hashCode của hai đối tượng
**Toán tử cascade ..**

Khi bạn có một chuỗi tác vụ trên đối tượng (gọi phương thức, thiết lập thuộc tính) thay vì phải viết đầy đủ đối tượng thì bạn chỉ cần viết nó một lần, các tương tác tiếp theo thay thế bằng ..

  var table = new Table(1);
  table
  ..calulateTotal()     //Thay cho table.calulateTotal();
  ..length=100          //Thay cho table.length=100;
  ..name='Abc'
  ..quantity=100
  ..showTotal();
 
Nếu bạn lớp của bạn sinh ra các đối tượng không thay đổi, hãy thêm từ khóa const vào trước hàm tạo.
