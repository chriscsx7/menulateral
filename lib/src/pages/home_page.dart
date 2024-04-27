import '../index.dart';

class HomePage extends StatelessWidget {
  final String usuario;
  const HomePage({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    ApiService apiService = ApiService();

    return FutureBuilder(
      future: apiService.getUserData(usuario),
      builder: (context, AsyncSnapshot snapshot) {
        final nombre = snapshot.data?[0] ?? 'Usuario';
        final correo = snapshot.data?[1] ?? 'Correo';
        final avatar = snapshot.data?[2] ?? 'Avatar';
        return PopScope(
          canPop: false,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Menu Lateral'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Cerrar sesión'),
                          content: const Text('¿Seguro que quieres cerrar sesión?'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Cancelar'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: const Text('Aceptar'),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                )
              ],
            ),
            drawer: Menu(nombre: nombre, correo: correo, avatar: avatar),
            body: const Center(
              child: Text('Bienvenido a la aplicación'),
            ),
          ),
        );
      }
    );
  }
}