import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() {
    print('Create State');
    return _MyHomePageState();
  }
  
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String icono= "assets/icons/martin.svg";
  String iconoResultado="assets/icons/Neutral.svg";
  String resultado = " ";

  _MyHomePageState() {
    print('Constructor');
  }

  @override
  void initState() {
    print('Objeto Init');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('Cambio Dependencias');
    super.didChangeDependencies();
  }

  @override
  void setState(VoidCallback fn) {
    print('rebuild');
    super.setState(fn);
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    print('Widget Actualizado');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('Widget removido temporalmente');
    super.deactivate();
  }

  @override
  void dispose() {
    print('Widget removido permanentemente');
    super.dispose();
  }

  @override
  void reassemble() {
    print('Hot Reload App');
    super.reassemble();
  }


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
    print('Build Realizado');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(243, 203, 243, 1),
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: null,
              child: const Text('Ejemplo Card'),
            ),
            ElevatedButton(
              onPressed: _goToList,
              child: const Text('Lista'),
            ),
            ElevatedButton(
              onPressed: _goToDetail,
              child: const Text('Detalle'),
            ),
            ElevatedButton(
              onPressed: null,
              child: const Text('Sensores'),
            ),
            ElevatedButton(
              onPressed: null,
              child: const Text('Gestos'),
            ),
          ]
        )
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
                  ElevatedButton(
                    onPressed: _incrementCounter,
                    child: const Icon(Icons.add_box),
                  ),

                  ElevatedButton(
                    onPressed: _resetCounter,
                    child: SvgPicture.asset(icono)
                  ),

                  ElevatedButton(
                    onPressed: _decreaseCounter,
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