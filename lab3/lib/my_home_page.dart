import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String icono= "assets/icons/martin.svg";
  String iconoResultado="assets/icons/Neutral.svg";
  String resultado = " ";

  void _incrementCounter() {
    setState(() {
      _counter++;

      if(_counter == 15)
      {
        resultado = "Victoria";
        iconoResultado = "assets/icons/Victory.svg";
      }
      else if(_counter == 10)
      {
        resultado = "Derrota";
        iconoResultado = "assets/icons/Lose.svg";
      }
      else
      {
        resultado = " ";
        iconoResultado="assets/icons/Neutral.svg";
      }
    });
  }

  void _decreaseCounter() {
    setState(() {
      _counter--;

      if(_counter == 15)
      {
        resultado = "Victoria";
        iconoResultado = "assets/icons/Victory.svg";
      }
      else if(_counter == 10)
      {
        resultado = "Derrota";
        iconoResultado = "assets/icons/Lose.svg";
      }
      else
      {
        resultado = " ";
        iconoResultado="assets/icons/Neutral.svg";
      }
    });
  }

  void _resetCounter() {
    setState(() {
      resultado = " ";
      iconoResultado="assets/icons/Neutral.svg";
      _counter = 0;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(243, 203, 243, 1),
        title: Text(widget.title),
      ),
      body: Center(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(iconoResultado, height: 100, width: 100,),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                resultado, 
                style: TextStyle(fontFamily: "Cyberpunk"),
              ),
              const Text(
                'Has pulsado el boton esta cantidad de veces:',
                style: TextStyle(fontFamily: "Cyberpunk"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: _incrementCounter,
                    tooltip: 'Incrementar',
                    child: const Icon(Icons.add_box),
                  ),

                  FloatingActionButton(
                    onPressed: _resetCounter,
                    tooltip: 'Resetear',
                    child: SvgPicture.asset(icono)
                  ),

                  FloatingActionButton(
                    onPressed: _decreaseCounter,
                    tooltip: 'Disminuir',
                    child: const Icon(Icons.exposure_minus_1),
                  ),
                ], 
              )
            ],
          ),
        ),
      ),
    );
  }
}

