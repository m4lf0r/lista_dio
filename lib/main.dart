import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contato> contatos = [];

  
    @override
    void initState() {
      super.initState();
      contatos.add(new Contato(
        nome: "Joao", telefone: "99870-8778", tipo: ContatoType.CELULAR));

      contatos.add(new Contato(
        nome: "Maria", telefone: "99870-4758", tipo: ContatoType.FAVORITO));
      
      contatos.add(new Contato(
        nome: "Esther", telefone: "99870-5898", tipo: ContatoType.CASA));

      contatos.add(new Contato(
        nome: "Ariel", telefone: "99812-4788", tipo: ContatoType.FAVORITO));

      contatos.add(new Contato(
        nome: "Eduardo", telefone: "95470-7888", tipo: ContatoType.FAVORITO));

      contatos.add(new Contato(
        nome: "Leandro", telefone: "98960-7897", tipo: ContatoType.TRABALHO));

      contatos.add(new Contato(
        nome: "Thiago", telefone: "98960-2389", tipo: ContatoType.TRABALHO));
      
      contatos.add(new Contato(
        nome: "Rayssa", telefone: "98951-3369", tipo: ContatoType.CASA));

      contatos.sort((a, b) => a.nome.compareTo(b.nome)); //Ordenando de fomra alfabética.
    }
    Widget build(BuildContext context) {
      return Scaffold(
        body: ListView.separated(
          itemBuilder: (context, index) {
            var contato = contatos[index];
            return ListTile(
              leading: CircleAvatar( //Incluir icone a esquerda
                child: Icon(Icons.account_circle),
                backgroundColor: Colors.blue[200],
              ),
              title: Text(contato.nome), 
              subtitle: Text(contato.telefone),
              trailing: IconButton( //Incluir icon a direita
                icon: Icon(Icons.call),
                onPressed: () => {},
                ),
            );
          }, 
          separatorBuilder: (context, index) => Divider(), 
          itemCount: contatos.length));
    }
  }
  
  class Contato {
    final String nome;
    final String telefone;
    final ContatoType tipo;

    Contato({@required this.telefone,@required this.tipo,@required this.nome});
}

enum ContatoType { CELULAR, TRABALHO, FAVORITO, CASA}