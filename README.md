## Tugas 9:
1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
   Jawab: Model Dart memberi validasi tipe, null-safety, struktur jelas, dan maintainability.
   Pakai Map langsung membuat rawan runtime error, tidak ada type checking, dan sulit dirawat.

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
   Jawab: http untuk request biasa tanpa cookie/session.
   CookieRequest untuk request yang membutuhkan autentikasi Django karena menyimpan dan mengirim cookie otomatis.

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
   Jawab: Agar status login dan cookie session tetap konsisten. Jika tiap widget membuat instance baru, sesi login hilang dan user dianggap logout.

4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
   Jawab: 10.0.2.2 di ALLOWED_HOSTS: agar emulator bisa akses server. CORS: agar Django mengizinkan request dari aplikasi Flutter. Pengaturan SameSite/cookie: agar session login tersimpan. Izin Internet Android: agar Flutter dapat mengirim request. Salah konfigurasi → request diblok, cookie tidak terkirim, atau Flutter gagal terhubung ke Django.

5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
   Jawab:
   Flutter ambil input → kirim ke Django → Django validasi & simpan → kirim JSON balik → Flutter parse ke model → tampilkan di UI.

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
   Jawab:
   Register: Flutter kirim data → Django buat user.
   Login: Flutter kirim kredensial via CookieRequest → Django buat session & kirim cookie → Flutter simpan cookie → user dianggap login.
   Akses data: CookieRequest kirim cookie ke Django.
   Logout: Flutter panggil endpoint → Django hapus session → Flutter reset status login.

7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial):
   Jawab: Sebagian besar mengikuti tutorial saja dengan beberapa penyesuaian, yang berbeda dari tutorial saat di akhir membuka myproductpage karena itu tidak ada di tutorial. Jadi intinya kita membuat dart baru lalu tombol di menu dihubungkan kesana. Di all product itu menampilkan product list sedangkan di myproduct hanya menampilkan product-product yang kita buat sendiri. 

## Tugas 8:
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
    Navigator.push() itu digunakan untuk menambahkan halaman baru di atas halaman sebelumnya dalam navigation stack. Halaman yang lama masih tersimpan di dmemori jadi bisa kembali dengan tombol back. Penggunaannya ada saat user menekan tombol all products dimana bila nanti sudah masuk terdapat tombol back untuk kembali ke halaman utama.
    Navigator.pushReplacement digunakan untuk mengganti halaman saat ini dengan halaman baru, jadi ga disimpan di stack jadi tidak bisa back. Penggunaannya nanti bila sudah kita buat fitur logout, maka bila sudah logout tidak bisa kita back untuk kembali ke halaman utama.

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
    Scaffold untuk kerangka utama halaman, menyusun komponen seperti AppBar, Drawer, dan body. Drawer untuk navigasi utama ke halaman di sebelah kiti yang memudahkan mengakses fitur-fitur. AppBar untuk menampilkan judul halaman.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
    Padding membuat jarak antar elemen afar tidak terlalu rapat, jadi rapi dan mudah dibaca. SingleChildScrollView buat halaman dapat di scroll. ListView digunakan kalau kita punya banyak elemen dengan jumlah dinamis seperti contohnya itu daftar produk, ListView otomatis dapat di scroll jadi memudahkan.

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
    Saya mengeditnya agar sesuai dengan tema toko ku yaitu Manchester City dimana ia memiliki warna biru muda/sky blue seperti yang kupakai. Ini di implementasikan di maindart melalui ThemaData dan ColorScheme

## Tugas 7:
1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Jawab:
Widget tree itu adalah struktur hierarki susunan widget. Setiap elemen UI di flutter itu merupakan widget yang saling berhubungan dengan hubungan parent-child. Parent berperan sebagai pembungkus atau pengatur tata letak, sedangkan widget child adalah elemen yang ditampilkan di dalamnya
Contoh: Scaffold adalah parent dengan Child AppBar, Body

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
Jawab:
MaterialApp: Widget utama tempat tema, navigasi, struktur dasar aplikasi
Scaffold: Struktur dasar halaman, dia yang menyediakan AppBar, Body, dan layout
AppBar: Menampilkan judul aplikasi
Text: Menampilkan teks sesuai namanya
Padding: Kasih jarak di sekitar widget agar enak dilihat
Column: Susun widget secara vertikal
Row: Susun widget secara horizontal
Card: Membuat tampilan kotak semacam kartu, disini dipakai untuk nama, NPM, kelas
SnackBar: Menampilkan pop up pesan kalau menekan tombol yang sudah di assign
Center: Menempatkan widget di tengah
Icon: Menampilkan icon

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
Jawab:
Dia itu berfungsi sebagai kerangka utama aplikasi Flutter, dia mengatur tema, warna, judul, juga menentukan home. MaterialApp sering dijadikan widget root karena ia menyediakan semua konfigurasi dasar yang dibutuhkan sehingga konsisten. Kita juga jadi dapat menggunakan widget seperti Scaffold, AppBar, SnackBar, dll.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
Jawab:
Stateless Widget itu widget yang tidak memiliki state atau keadaan yang berubah, jadi tampilan selalu sama, contohnya teks atau ikon
Stateful Widget kebalikannya, ia dapat berubah selama aplikasi berjalan, misalnya memerlukan input dari user
Jadi kita memilih stateless widget ketika konten yang mau kita tampilkan bersifat tetap dan stateful widget ketika ada perubahan yang harus diperbarui di layar user.

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
Jawab: 
BuildContext itu objek yang merepresentasikan posisi suatu widget dalam widget tree. Dia digunakan untuk menemukan hubungan antar widget dan mengakses informasi dari parent. Ia bisa mengambil tema, menampilkan snackbar, melakukan navigasi antar halaman.

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Jawab:
Hot reload itu memperbarui kode aplikasi tanpa menghapus state yang lagi berjalan, ini sangat cocok kalau lagi mengedit UI, saat mengembangkan UI
Hot restart  itu mereset aplikasi dari awal jadi singkatrnya jalani ulang aplikasi dari 0
