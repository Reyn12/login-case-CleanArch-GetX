# Login Case with Clean Architecture & GetX

Aplikasi Flutter sederhana yang mengimplementasikan:
- Clean Architecture
- State Management GetX
- Shared Preferences untuk penyimpanan lokal
- Routing dengan GetX Navigation

## Fitur

1. **Autentikasi**
   - Login dengan email & password
   - Penyimpanan token menggunakan Shared Preferences
   - Auto login jika token masih valid

2. **Navigasi**
   - Navigasi antar halaman menggunakan GetX Navigation
   - Bottom Navigation Bar untuk menu utama

3. **Halaman**
   - Login Page
   - Dashboard (Home, Riwayat, Profile)

## Struktur Folder

```
lib/
├── core/                  # Core functionality
│   ├── constants/         # Constants & enums
│   ├── routes/            # Route management
│   └── theme/             # App theme & styling
├── data/                  # Data layer
│   ├── datasources/       # Data sources (local & remote)
│   ├── models/           # Data models
│   └── repositories/      # Repository implementations
├── domain/                # Business logic
│   ├── entities/          # Business objects
│   ├── repositories/      # Abstract repositories
│   └── usecases/          # Business use cases
└── presentation/          # UI layer
    ├── controllers/       # GetX controllers
    ├── pages/             # Screens
    └── widgets/           # Reusable widgets
```

## Teknologi yang Digunakan

- **Flutter** - Framework UI
- **GetX** - State Management & Dependency Injection
- **Shared Preferences** - Penyimpanan lokal
- **Dio/Http** - HTTP Client
- **Get Storage** - Alternative storage (opsional)

## Cara Menjalankan

1. Pastikan Flutter SDK sudah terinstall
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Jalankan aplikasi:
   ```bash
   flutter run
   ```

## Dependencies

Package utama yang digunakan dalam project ini:

### Dependencies
- `get: ^4.6.6` - State management, dependency injection, dan routing
- `shared_preferences: ^2.2.2` - Penyimpanan lokal untuk token
- `dio: ^5.4.0` - HTTP client untuk API calls
- `get_storage: ^2.1.1` - Alternatif penyimpanan key-value yang cepat

### Dev Dependencies
- `get_cli: ^2.4.0` - CLI untuk generate struktur folder dan file otomatis

### Cara Install
1. Tambahkan dependencies di file `pubspec.yaml`:
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     get: ^4.6.6
     shared_preferences: ^2.2.2
     dio: ^5.4.0
     get_storage: ^2.1.1

   dev_dependencies:
     flutter_test:
       sdk: flutter
     get_cli: ^2.4.0
   ```

2. Jalankan perintah:
   ```bash
   flutter pub get
   ```

## Catatan

- Pastikan untuk mengatur base URL API di file konfigurasi
- Token disimpan secara aman menggunakan Shared Preferences
- Aplikasi menggunakan null safety

## Kontribusi

Silakan fork dan buat pull request untuk berkontribusi pada proyek ini.
