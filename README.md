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
