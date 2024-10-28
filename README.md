# Insta-DAM

Estructura

InstaDAM/
├── android/                    # Archivos específicos de Android
├── ios/                        # Archivos específicos de iOS
├── lib/                        # Código fuente principal de la aplicación
│   ├── main.dart               # Punto de entrada de la aplicación
│   ├── models/                 # Modelos de datos
│   │   └── user.dart           # Ejemplo de modelo de usuario
│   ├── screens/                # Pantallas de la aplicación
│   │   ├── home_screen.dart    # Pantalla principal
│   │   ├── login_screen.dart   # Pantalla de inicio de sesión
│   │   └── profile_screen.dart # Pantalla de perfil
│   ├── widgets/                # Widgets reutilizables
│   │   └── custom.dart  # <!--TODO: -->
│   ├── services/               # Servicios (API, autenticación, etc.)
│   │   └── data_service.dart    # Ejemplo de servicio API
│   ├── utils/                  # Utilidades y funciones auxiliares
│   │   └── constants.dart      # Constantes de la aplicación
│   └── providers/              # Proveedores para el manejo de estado
│       └── user_provider.dart  # Ejemplo de proveedor de usuario
├── test/                       # Pruebas unitarias y de integración
│   └── widget_test.dart        # Ejemplo de prueba de widget
├── pubspec.yaml                # Archivo de configuración de dependencias
└── README.md                   # Documentación del proyecto