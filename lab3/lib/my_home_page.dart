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

  void _goToList()
  {
     Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SecondScreen()),
  );
  }

  void _goToDetail()
  {
     Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ThirdScreen()),
  );
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
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: _goToList,
              tooltip: 'Ir a Lista',
              child: const Icon(Icons.list),
            ),
            FloatingActionButton(
              onPressed: _goToDetail,
              tooltip: 'Ir a Detalle',
              child: const Icon(Icons.line_style),
            ),
          ]
        )
     ],
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 50),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Volver!'),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 50),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: 50,
                    color: Colors.pink[600],
                    child: const Center(child: Text('Primero')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.pink[500],
                    child: const Center(child: Text('Segundo')),
                  ),
                  Container(
                    height: 50,
                    color: Colors.pink[100],
                    child: const Center(child: Text('Tercero')),
                  ),
                ],
              ),
            ),
          ]
        )
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 200),
                  ),
                  const Text(
                    'text', 
                    style: TextStyle(fontFamily: "Cyberpunk"),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 200),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  child: const Text('Volver!'),
                  ),
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}