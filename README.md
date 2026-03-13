# 🚀 Flutter Clean Architecture Starter

[![Flutter CI](https://github.com/MiguelOquendoRincon/flutter_clean_starter/actions/workflows/flutter_ci.yml/badge.svg)](https://github.com/MiguelOquendoRincon/flutter_clean_starter/actions/workflows/flutter_ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter Version](https://img.shields.io/badge/Flutter-3.x-blue.svg)](https://flutter.dev)

Este es un **Starter Template** profesional para proyectos Flutter, diseñado bajo los principios de **Clean Architecture** y las mejores prácticas de la industria. Ideal para desarrolladores que buscan una base sólida, escalable y mantenible para aplicaciones de nivel empresarial.

---

## 🏗️ Arquitectura del Proyecto

El proyecto sigue una estructura de capas estrictamente separadas para garantizar la responsabilidad única y la facilidad de testeo:

### 1. **Domain Layer (Core Business Logic)**
- **Entities:** Modelos de negocio puros, independientes de librerías externas.
- **Use Cases:** La lógica de negocio específica de la aplicación.
- **Repositories Interfaces:** Definiciones de contratos para la comunicación con los datos.

### 2. **Data Layer (Infrastructure)**
- **Models:** Extensiones de las entidades con lógica de serialización (JSON).
- **Repositories Implementations:** Lógica para decidir si los datos vienen de una API o persistencia local.
- **Data Sources:** Implementaciones concretas de clientes de red (Remote) o bases de datos (Local).

### 3. **Presentation Layer (UI & Logic)**
- **BLoC/Cubit:** Gestión de estado reactiva y predecible.
- **Pages/Widgets:** Componentes visuales desacoplados de la lógica de negocio.

---

## 🛠️ Stack Tecnológico

- **Language:** [Dart](https://dart.dev/)
- **Framework:** [Flutter](https://flutter.dev/)
- **State Management:** [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Dependency Injection:** [get_it](https://pub.dev/packages/get_it) & [injectable](https://pub.dev/packages/injectable)
- **Networking:** [dio](https://pub.dev/packages/dio) (con interceptores personalizados)
- **Local Storage:** [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage)
- **Code Generation:** [freezed](https://pub.dev/packages/freezed) & [json_serializable](https://pub.dev/packages/json_serializable)
- **Functional Programming:** [dartz](https://pub.dev/packages/dartz) (para el manejo de Fallos/Excepciones)
- **Testing:** [mocktail](https://pub.dev/packages/mocktail) & [bloc_test](https://pub.dev/packages/bloc_test)

---

## ⚙️ Configuración y Uso

### Requisitos Previos
- Flutter SDK (Canal estable)
- Dart SDK

### Instalación
1. Clona el repositorio:
   ```bash
   git clone https://github.com/MiguelOquendoRincon/flutter_clean_starter.git
   ```
2. Instala las dependencias:
   ```bash
   flutter pub get
   ```
3. Genera el código necesario (Injectable, Freezed, etc.):
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

### Ejecutar Tests
```bash
flutter test
```

---

## 🧪 CI/CD Pipeline
El proyecto incluye un flujo de **GitHub Actions** optimizado que se ejecuta en cada Push y Pull Request a las ramas `main` y `develop`. El pipeline incluye:
- Caché inteligente de dependencias Pub.
- Verificación de formato de código.
- Análisis estático (Lints).
- Ejecución de tests unitarios.
- Generación y subida de reportes de cobertura de código.

---

## 🤝 Contribuciones
Las contribuciones son bienvenidas. Si encuentras algún error o tienes una mejora, por favor abre un **Issue** o envía un **Pull Request**.

---

## 📄 Licencia
Este proyecto está bajo la licencia MIT. Consulta el archivo `LICENSE` para más detalles.

---
Enviado con ❤️ por [Miguel Oquendo](https://github.com/MiguelOquendoRincon)
