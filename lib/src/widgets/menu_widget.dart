import '../index.dart';


class Menu extends StatelessWidget {
  final String nombre;
  final String correo;
  final String avatar;
  const Menu({super.key, required this.nombre, required this.correo, required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      child: ListView(
        children: <Widget> [
          UserAccountsDrawerHeader(
            accountName: Text(nombre, style: const TextStyle(
              backgroundColor: Colors.black,
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),),
            accountEmail: Text(correo, style: const TextStyle(
              backgroundColor: Colors.black,
              color: Colors.white,
              fontWeight: FontWeight.w600
            ),),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(avatar),
                fit: BoxFit.cover,
              ),
            ),
          ),
          newInk(Icons.home, 'Inicio', '' , context),
          const SizedBox(height: 10),
          newInk(Icons.store, 'Empresa', '/empresa' , context),
          const SizedBox(height: 10),
          newInk(Icons.contact_page, 'Contacto', '/contacto' , context),
          const SizedBox(height: 10),
          newInk(Icons.shopping_bag, 'Productos', '/productos' , context),
        ],
      )
    );
  }

  Ink newInk(IconData icono, String texto, String ruta, BuildContext context) {
    return Ink(
      color: Colors.black,
      child: ListTile(
        title: Text(
          texto,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600
          ),
          textAlign: TextAlign.center,
        ),
        leading: Icon(
          icono,
          color: Colors.white
        ),
        onTap: () {
          if (ruta == '') Navigator.pop(context);
          if (ruta != '') Navigator.pushNamed(context, ruta);
        },
      ),
    );
  }
}