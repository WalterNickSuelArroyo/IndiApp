import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indi_app/main.dart';
import 'package:indi_app/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';
import 'package:indi_app/src/presentation/pages/client/home/bloc/ClientHomeEvent.dart';
import 'package:indi_app/src/presentation/pages/client/home/bloc/ClientHomeState.dart';
import 'package:indi_app/src/presentation/pages/profile/info/ProfileInfoPage.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  List<Widget> pageList = <Widget>[
    // ClientMapSeekerPage(),
    // ClientHistoryTripPage(),
    ProfileInfoPage(),
    // RolesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu de opciones'),
      ),
      body: BlocBuilder<ClientHomeBloc, ClientHomeState>(
        builder: (context, state) {
          return pageList[state.pageIndex];
        },
      ),
      drawer: BlocBuilder<ClientHomeBloc, ClientHomeState>(
        builder: (context, state) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromARGB(255, 0, 123, 175), // #007BAF
                          Color.fromARGB(255, 0, 225, 255), // #00E1FF
                        ],
                      ),
                    ),
                    child: Text(
                      'Menu del cliente',
                      style: TextStyle(color: Colors.white),
                    )),
                ListTile(
                  title: Text('Perfil del usuario'),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    context
                        .read<ClientHomeBloc>()
                        .add(ChangeDrawerPage(pageIndex: 0));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Cerrar sesion'),
                  onTap: () {
                    context.read<ClientHomeBloc>().add(Logout());
                    // context.read<BlocSocketIO>().add(DisconnectSocketIO());
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                      (route) => false
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
      // appBar: AppBar(
      //   title: Text(
      //     'Menu de opciones',
      //   ),
      //   // flexibleSpace: Container(
      //   //   decoration: BoxDecoration(
      //   //     gradient: LinearGradient(
      //   //       begin: Alignment.topRight,
      //   //       end: Alignment.bottomLeft,
      //   //       colors: [
      //   //         Color.fromARGB(255, 12, 38, 145),
      //   //         Color.fromARGB(255, 34, 156, 249),
      //   //       ]
      //   //     ),
      //   //   )
      //   // ),
      // ),
      // body: BlocBuilder<ClientHomeBloc, ClientHomeState>(
      //   builder: (context, state) {
      //     return pageList[state.pageIndex];
      //   },
      // ),
      // drawer: BlocBuilder<ClientHomeBloc, ClientHomeState>(
      //   builder: (context, state) {
      //     return Drawer(
      //       child: ListView(
      //         padding: EdgeInsets.zero,
      //         children: [
      //           DrawerHeader(
      //             decoration: BoxDecoration(
      //               gradient: LinearGradient(
      //                 begin: Alignment.topRight,
      //                 end: Alignment.bottomLeft,
      //                 colors: [
      //                   Color.fromARGB(255, 12, 38, 145),
      //                   Color.fromARGB(255, 34, 156, 249),
      //                 ]
      //               ),
      //             ),
      //             child: Text(
      //               'Menu del cliente',
      //               style: TextStyle(color: Colors.white),
      //             )
      //           ),
      //           ListTile(
      //             title: Text('Mapa de busqueda'),
      //             selected: state.pageIndex == 0,
      //             onTap: () {
      //               context.read<ClientHomeBloc>().add(ChangeDrawerPage(pageIndex: 0));
      //               Navigator.pop(context);
      //             },
      //           ),
      //           ListTile(
      //             title: Text('Historial de viajes'),
      //             selected: state.pageIndex == 1,
      //             onTap: () {
      //               context
      //                   .read<ClientHomeBloc>()
      //                   .add(ChangeDrawerPage(pageIndex: 1));
      //               Navigator.pop(context);
      //             },
      //           ),
      //           ListTile(
      //             title: Text('Perfil del usuario'),
      //             selected: state.pageIndex == 2,
      //             onTap: () {
      //               context
      //                   .read<ClientHomeBloc>()
      //                   .add(ChangeDrawerPage(pageIndex: 2));
      //               Navigator.pop(context);
      //             },
      //           ),
      //           ListTile(
      //             title: Text('Roles de usuario'),
      //             selected: state.pageIndex == 3,
      //             onTap: () {
      //               context
      //                   .read<ClientHomeBloc>()
      //                   .add(ChangeDrawerPage(pageIndex: 3));
      //               Navigator.pop(context);
      //             },
      //           ),
      //           ListTile(
      //             title: Text('Cerrar sesion'),
      //             onTap: () {
      //               context.read<ClientHomeBloc>().add(Logout());
      //               context.read<BlocSocketIO>().add(DisconnectSocketIO());
      //               Navigator.pushAndRemoveUntil(
      //                 context,
      //                 MaterialPageRoute(builder: (context) => MyApp()),
      //                 (route) => false
      //               );
      //             },
      //           )
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
