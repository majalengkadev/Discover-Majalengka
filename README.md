# Discover Majalengka

Discover Majalengka App adalah aplikasi berisikan informasi tempat-tempat yang ada di kab Majalengka.

Aplikasi ini menggunakan Rest API dari [OpenApi MajalengkaDev](https://openapi.majalengkadev.com) sebagai sumber datanya.

### Getting Started

Download project deppendecy menggunakan command:

```
flutter pub get
```


Peroject ini menggunakan library [GetX](https://pub.dev/packages/get) sebagai State Manajemenya.

### API Key

1. Daftar dan Create API Key dari [OpenApi MajalengkaDev](https://openapi.majalengkadev.com) 
2. Rename file `.env.example` menjadi `.env` dan masukkan API Key yang telah dibuat sebelumnya.
3. Generate file config `.env` [info envied](https://pub.dev/packages/envied) dengan command :
    ```
    flutter pub run build_runner build
    ```

### Generate Template GetX

Untuk memudahkan membuatkan pattern module bisa menggunakan [Get CLI](https://pub.dev/packages/get_cli).

1. Instal GetX CLI
    ```
    flutter pub global activate get_cli
    ```
2. Membuat module / page, misalkan kita mau membuat module `user` maka commandnya:
    ```
    get create page:user
    ```
    Hasil generatenya berupa View, Controller dan Binding yang bisa ditemukkan di folder `lib/app/modules/user`
