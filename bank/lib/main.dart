import 'package:flutter/material.dart';

void main() => runApp(BankApp());

class BankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: FormularioTransferencia()));
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();

  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Criando Transferência",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
        //foregroundColor: Color.fromRGBO(10, 10, 10, 1),
      ),

      body: Column(
        children: <Widget>[
          Editor(
            controlador: _controladorCampoNumeroConta,
            rotulo: "Número da Conta",
            dica: "0000",
          ),

          Editor(
            controlador: _controladorCampoValor,
            rotulo: "Valor",
            dica: "0.00",
            icone: Icons.monetization_on,
          ),

          ElevatedButton(
            child: Text("Confirmar"),
            onPressed: () {
              debugPrint("Clicou no confirmar!");

              _criaTransferencia(_controladorCampoNumeroConta, _controladorCampoValor);
              
            },
          ),
        ],
      ),
    );
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 25.0),

        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),

        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(111.50, 1000)),
          ItemTransferencia(Transferencia(211.50, 2000)),
          ItemTransferencia(Transferencia(311.50, 3000)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Botão + pressionado!");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  // Campos para armazenar os dados do item
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return "Transferencia {valor: $valor, numeroConta: $numeroConta}";
  }
}

void _criaTransferencia(
  TextEditingController controladorCampoNumeroConta,
  TextEditingController controladorCampoValor,
) {

  final int? numeroConta = int.tryParse(controladorCampoNumeroConta.text);

  final double? valor = double.tryParse(controladorCampoValor.text);

  if (numeroConta != null && valor != null) {
    final transferenciaCriada = Transferencia(valor, numeroConta);
    debugPrint("$transferenciaCriada");
  }
}