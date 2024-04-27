import '../index.dart';

class EmpresaPage extends StatelessWidget {
  const EmpresaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empresa'),
      ),
      body: const Center(
        child: Text('Sección de Empresa'),
      )
    );
  }
}