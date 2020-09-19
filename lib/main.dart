import 'package:flutter/material.dart';
import 'package:flutter_app_consulta_tempo/endpoints.dart';
import 'package:flutter_app_consulta_tempo/responseService.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tempo Agora"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Insira o endereço",
                    labelText: "Insira o endereço"
                ),
                controller: _name,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Insira o nome da pessoa';
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {

                    }
                  },
                  child: Text('Buscar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getAddress(String address) async {
    List<Placemark> listPlacemarks = await Geolocator().placemarkFromAddress(address);

    Position position = listPlacemarks[0].position;
    ResponseService response = await getInfoWeather(position.latitude, position.longitude);
  }



}
