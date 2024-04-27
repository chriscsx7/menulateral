// ignore_for_file: use_build_context_synchronously
import '../index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ApiService apiService = ApiService();
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  bool? usuarioValido;

  @override
  Widget build(BuildContext context) {
    passwordController.text = '';

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Login'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage('assets/avatar.jpeg'),
            ),
            const SizedBox(height: 32.0),
            TextField(
              controller: userController,
              decoration: const InputDecoration(
                labelText: 'Usuario',
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                )
              ),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20
              )
            ),
            const SizedBox(height: 80.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 26
                )
              ),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20
              )
            ),
            const SizedBox(height: 120.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              onPressed: () async {
                final result = await apiService.getUser(userController.text, passwordController.text);
                setState(() {
                  usuarioValido = result;
                });
                if (usuarioValido == true) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(usuario: userController.text)));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.blue,
                      content: Text(
                        'Usuario o contraseña incorrectos',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Iniciar sesión',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}