import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppMaster Jimenez',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IngresoSistema(),
    );
  }
}

class IngresoSistema extends StatefulWidget {
  @override
  _IngresoSistemaState createState() => _IngresoSistemaState();
}

class _IngresoSistemaState extends State<IngresoSistema> {
  bool acceso = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            print('Menu button');
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              print('Search button');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              print('Filter button');
            },
          ),
        ],
        title: Text('Ingreso al Sistema'),
      ),
      body: SafeArea(
        child: ListView(padding: EdgeInsets.symmetric(horizontal: 54.0), children: <Widget>[
          SizedBox(height: 80.0),
          Column(
            children: <Widget>[
              Image.asset('assets/ilustracao-do-conceito-de-login_114360-4525.webp'),
              SizedBox(height: 16.0),
            ],
          ),
          if (!acceso)
            Column(children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  // fillColor: Colors.amber,
                  labelText: 'Nombre de Usuario',
                  fillColor: Colors.amber.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Contraseña',
                  fillColor: Colors.amber.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      child: Text('Cancelar'),
                      onPressed: () {
                        setState(() {
                          acceso = false;
                        });
                      },
                    ),
                    RaisedButton(
                      color: Colors.amberAccent,
                      child: Text(
                        'Aceptar',
                      ),
                      onPressed: () {
                        setState(() {
                          acceso = true;
                        });
                      },
                    ),
                  ],
                ),
              )
            ]) //Fin columna
          else
            Center(
              child: Column(
                children: <Widget>[
                  Text('YAY, ¡Estoy en linea!'),
                  RaisedButton(
                    color: Colors.amberAccent,
                    elevation: 15.0,
                    child: Text('Salir'),
                    onPressed: () {
                      setState(() {
                        acceso = false;
                      });
                    },
                  )
                ],
              ),
            )
        ]),
      ),
    );
  }
}
