import "package:flutter/material.dart";

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Transferências",
            ),
          ),

          body: const Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
                title: Text("420,00"),
                subtitle: Text("data"),
            ),
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print('Botão + pressionado');
            },
            child: Icon(Icons.add),
          ),
        ),
      ),

      // ignore: prefer_const_constructors
      // Column(
      //   children: const <Widget>[
      //     Text(
      //       "Boa!",
      //       textDirection: TextDirection.ltr,
      //     ),
      //     Text(
      //       "Pra nós",
      //       textDirection: TextDirection.ltr,
      //       textScaler: TextScaler.linear(2 * 2),
      //     ),
      //     Expanded(
      //       child: FittedBox(
      //         fit: BoxFit.contain,
      //         child: FlutterLogo(),
      //       ),
      //     ),
      //   ],
      // ),
    );
