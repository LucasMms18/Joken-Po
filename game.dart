import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  var _imagemApp = AssetImage("imagens/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhausuario){
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random(). nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Escolha do App: " + escolhaApp);
    print("Escolha do Usuario: " + escolhausuario);

    switch( escolhaApp ){
      case "pedra" :
        setState(() {
          this._imagemApp = AssetImage("imagens/pedra.png");
        });
        break;
      case "papel" :
        setState(() {
          this._imagemApp = AssetImage("imagens/papel.png");
        });
        break;
      case "tesoura" :
        setState(() {
          this._imagemApp = AssetImage("imagens/tesoura.png");
        });
        break;
    }
    if(
            (escolhausuario == "pedra" && escolhaApp == "tesoura") ||
            (escolhausuario == "tesoura" && escolhaApp == "papel") ||
            (escolhausuario == "papel" && escolhaApp == "pedra")
    ){
      setState(() {
        this._mensagem = "Parabéns!!! Você ganhou :";
      });
    }else if (
        (escolhaApp == "pedra" && escolhausuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhausuario == "papel") ||
        (escolhaApp == "papel" && escolhausuario == "pedra")
    ){
      setState(() {
        this._mensagem = "Você perdeu :(";
      });
  }else{
      setState(() {
        this._mensagem = "Empatamos ;)";
      });
    }

    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Joken Po"),
      ) ,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 26),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: this._imagemApp,),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 26),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra") ,
                child: Image.asset("imagens/pedra.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel") ,
                child: Image.asset("imagens/papel.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura") ,
                child: Image.asset("imagens/tesoura.png", height: 100,),
              ),
            ],
          )
        ],
      ) ,
      
    );
  }
}