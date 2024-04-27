import '../src/index.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Lateral',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder> {
        '/inicio': (BuildContext context) => const LoginPage(),
        '/empresa': (BuildContext context) => const EmpresaPage(),
        '/contacto': (BuildContext context) => const ContactoPage(),
        '/productos': (BuildContext context) => const ProductosPage(),
      },
      initialRoute: '/inicio',
    );
  }
}