import 'package:flutter/material.dart';
import 'package:streams_tareas/services/firebase.services.dart';
import 'package:streams_tareas/services/notification.services.dart';
import 'package:streams_tareas/widget/counter_stream.dart';
import 'package:streams_tareas/widget/tarea.dart';


class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final _counterStream = CounterStream();
  List<Tarea> listadeTareas = [];
  Tarea nuevaTarea = Tarea(0, "", false);

  @override
  void initState() {
    super.initState();
    _counterStream.startCounter(listadeTareas);
  }

  @override
  void dispose() {
    _counterStream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Counter"),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: StreamBuilder<List<Tarea>>(
          stream: _counterStream.counterStream,
          builder: (context, snapshot) {
            listadeTareas = snapshot.data!;
            if (snapshot.hasData) {
              return buildbody();
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget buildbody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: buildListView(listadeTareas),
        ),
        // Espacio entre el ListView y el botón
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ElevatedButton(
            onPressed: () {
              
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  String userInput =
                      ''; // Variable para guardar el texto ingresado
                  return AlertDialog(
                    title: Text('Nombra tu tarea'),
                    content: TextField(
                      onChanged: (value) {
                        userInput = value; // Guardar el texto ingresado
                      },
                      decoration: InputDecoration(
                        hintText: 'Ingrese el texto aquí',
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Guardar'),
                        onPressed: () async {
                        mostrar();  
                          nuevaTarea = Tarea(
                              listadeTareas.length + 1, '$userInput', false);
                          listadeTareas.add(nuevaTarea);
                          _counterStream.startCounter(listadeTareas);
                          Navigator.of(context).pop(); // Cerrar el diálogo
                        await  setTarea(listadeTareas.length + 1, '$userInput', false);
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Añadir'),
          ),
        ),
        SizedBox(height: 50), // Espacio entre el botón y el borde inferior
      ],
    );
  }

  Widget buildListView(List<Tarea> miList) {
    return Center(
      child: ListView.builder(
        itemCount: miList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Row(
              children: [
                Container(
                  width: 25, // Ancho predefinido para el índice
                  decoration: BoxDecoration(
                    border: Border.all(), // Borde para visualización
                  ),
                  child: Center(
                    child: Text('${miList[index].id}'), // Contenido del índice
                  ),
                ),
                //SizedBox(width: 20), // Espacio entre elementos
                Container(
                  width: 100, // Ancho predefinido para el nombre
                  decoration: BoxDecoration(
                    border: Border.all(), // Borde para visualización
                  ),
                  child: Center(
                    child: Text(miList[index].titulo), // Contenido del nombre
                  ),
                ),
                // SizedBox(width: 20), // Espacio entre elementos
                Container(
                  width: 100, // Ancho predefinido para el estado
                  decoration: BoxDecoration(
                    border: Border.all(), // Borde para visualización
                  ),
                  child: Center(
                    child: Text(
                      miList[index].estado == true ? 'Completado' : 'Pendiente',
                      style: TextStyle(
                        color: miList[index].estado == true
                            ? Colors.green
                            : Colors.red,
                      ),
                    ), // Contenido del estado
                  ),
                ),
                const SizedBox(width: 20),
                RawMaterialButton(
                  onPressed: () {
                    // Función que se ejecutará al presionar el botón
                    miList.removeAt(index);
                    _counterStream.startCounter(miList);
                  },
                  constraints: BoxConstraints.tightFor(
                    width: 25,
                    height: 25,
                  ),
                  materialTapTargetSize: MaterialTapTargetSize
                      .shrinkWrap, // Ajusta el tamaño del tap target
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  fillColor: Colors.red,
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 20),
                RawMaterialButton(
                  onPressed: !miList[index].estado
                      ? () {
                          // Función que se ejecutará al presionar el botón si está habilitado
                          miList[index].estado = true;
                          _counterStream.startCounter(miList);
                        }
                      : null,
                  constraints: BoxConstraints.tightFor(
                    width: 25,
                    height: 25,
                  ),
                  materialTapTargetSize: MaterialTapTargetSize
                      .shrinkWrap, // Ajusta el tamaño del tap target
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  fillColor: Colors.green,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
