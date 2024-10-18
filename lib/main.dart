import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Elimina el banner de debug
      theme: ThemeData(
        fontFamily: 'Mulish', // Usamos la fuente Mulish globalmente
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF00BFA6),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.black),
          displayMedium: TextStyle(fontSize: 28, color: Colors.black),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isPasswordVisible = false; // Estado para controlar si la contraseña es visible

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Espaciado general
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50), // Espacio en la parte superior para bajar todo

              // Título con la palabra "CampJu" en negrita, en la misma línea que "Bienvenido a"
              const Text.rich(
                TextSpan(
                  text: 'Bienvenido a ', // Texto normal
                  style: TextStyle(fontSize: 24, color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'CampJu', // "CampJu" en negrita
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 1), // Espacio entre el título y el logo

              // Logo de la aplicación
              Image.asset(
                'assets/campju_logo.jpeg',
                width: 250, // Ajusta el tamaño del logo
              ),
              const SizedBox(height: 20),

              // Campos de texto para usuario y contraseña
              _buildTextField('Nombre de usuario', Icons.person),
              const SizedBox(height: 10),

              // Campo de texto para la contraseña con botón de "ojito"
              TextField(
                obscureText: !_isPasswordVisible, // Controla si la contraseña es visible o no
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color(0xFF00BFA6), // Color del ícono
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 1),

              // Olvidaste tu contraseña
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // Alinea todo hacia la derecha
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      '¿Olvidaste tu contraseña?',
                       style: TextStyle(color: Color(0xFF00BFA6)),
                     ),
                  ),
                   const SizedBox(width: 10), // Añade un espacio para no pegar completamente al borde
                ],
              ),
              const SizedBox(height: 2),

              // Icono de huella para inicio de sesión biométrico
              IconButton(
                icon: const Icon(Icons.fingerprint, size: 70, color: Color.fromARGB(255, 0, 0, 0)),
                onPressed: () {},
              ),
              const SizedBox(height: 20), // Espacio entre huella y botón

              // Botón de iniciar sesión
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00BFA6), // Color de fondo del botón
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 60.0), // Ajusta el tamaño del botón
                  textStyle: const TextStyle(fontSize: 18),
                  foregroundColor: Colors.white, // Color del texto (palabra "Iniciar sesión")
                ),
                child: const Text('Iniciar sesión'),
              ),
              const SizedBox(height: 20),
              
              // Registro de cuenta con "Registrarse" en negrita
              TextButton(
                onPressed: () {},
                child: const Text.rich(
                  TextSpan(
                    text: '¿No tienes una cuenta? ', // Texto normal
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Registrarse', // Texto en negrita
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Función que genera los campos de texto reutilizables
  Widget _buildTextField(String label, IconData icon, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: const Color(0xFF00BFA6), // Aquí cambiamos el color del ícono
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
