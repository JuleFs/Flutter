# VetCare - Aplicación Móvil para Clínica Veterinaria

Aplicación móvil desarrollada en Flutter para clientes de una clínica veterinaria que permite gestionar mascotas, agendar citas, consultar historial médico y recibir notificaciones.

## Características Principales

### Para Clientes (Dueños de Mascotas)
- ✅ Registro e inicio de sesión
- ✅ Registro y visualización de mascotas
- ✅ Solicitar y consultar citas con fecha, hora y motivo
- ✅ Consultar el historial médico de cada mascota
- ✅ Recibir notificaciones automáticas (recordatorios de citas o vacunas)
- ✅ Actualizar información personal (nombre, correo, teléfono)

## Pantallas Implementadas

1. **Login Screen** - Inicio de sesión con correo y contraseña
2. **Register Screen** - Registro de nuevos usuarios
3. **Home Screen** - Pantalla principal con acciones rápidas y resumen
4. **Pets Screen** - Lista de todas las mascotas del usuario
5. **Pet Detail Screen** - Información detallada de una mascota
6. **Appointments Screen** - Gestión de citas (próximas e historial)
7. **Book Appointment Screen** - Agendar nueva cita
8. **Medical History Screen** - Historial médico de una mascota
9. **Profile Screen** - Perfil del usuario y configuración

## Tecnologías

- **Flutter** - Framework de desarrollo móvil
- **Material Design 3** - Sistema de diseño moderno
- **Dart** - Lenguaje de programación

## Diseño

La aplicación utiliza un esquema de colores cálido y amigable:
- **Color Principal**: Naranja vibrante (#FF9500) - Representa energía y cuidado
- **Color Secundario**: Verde fresco (#34C759) - Representa salud y naturaleza
- **Color Acento**: Amarillo cálido (#FFCC00) - Representa felicidad
- **Fondo**: Gris claro (#F9F9F9)
- **Superficie**: Blanco (#FFFFFF)

## Próximos Pasos

Para conectar con el backend:

1. **Configurar servicios API**:
   - Crear archivos de servicio en `lib/services/`
   - Implementar llamadas HTTP al backend Node.js
   - Manejar autenticación con JWT

2. **Gestión de estado**:
   - Implementar Provider, Riverpod o Bloc para manejo de estado
   - Almacenar tokens de autenticación de forma segura

3. **Notificaciones Push**:
   - Integrar Firebase Cloud Messaging
   - Configurar notificaciones locales

4. **Características adicionales**:
   - Subida de imágenes de mascotas
   - Chat con veterinarios
   - Pagos en línea
   - Mapa para ubicación de la clínica

## Instalación

```bash
# Instalar dependencias
flutter pub get

# Ejecutar en modo desarrollo
flutter run

# Compilar para producción
flutter build apk # Android
flutter build ios # iOS
```

## Estructura del Proyecto

```
lib/
├── main.dart                 # Punto de entrada
├── theme/
│   └── app_theme.dart       # Tema y colores de la app
├── screens/
│   ├── login_screen.dart
│   ├── register_screen.dart
│   ├── home_screen.dart
│   ├── pets_screen.dart
│   ├── pet_detail_screen.dart
│   ├── appointments_screen.dart
│   ├── book_appointment_screen.dart
│   ├── medical_history_screen.dart
│   └── profile_screen.dart
└── models/
    ├── pet.dart
    ├── appointment.dart
    └── medical_record.dart
```

## Notas

- Los datos actuales son simulados (mock data)
- Se debe integrar con la API REST del backend (Node.js + PostgreSQL)
- Implementar validaciones y manejo de errores según sea necesario
- Añadir loading states y feedback visual para mejor UX
