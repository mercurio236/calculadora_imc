import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _stateInfo = 'Informe seus dados';

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<
      FormState>(); // valida se os campos no formulario estao preenchidos

  void _resetFields() {
    weightController.text = '';
    heightController.text = '';
    setState(() {
      _stateInfo = 'Iforme os seus dados';
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculated() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;

      double imc = weight / (height * height);

      if (imc < 18.6) {
        _stateInfo = 'Abaixo do peso (${imc.toStringAsPrecision(2)})';
      } else if (imc >= 18.6 && imc < 24.9) {
        _stateInfo = 'Peso ideal (${imc.toStringAsPrecision(2)})';
      } else if (imc >= 24.9 && imc < 29.9) {
        _stateInfo = ' Levemente acima do peso (${imc.toStringAsPrecision(2)})';
      } else if (imc >= 29.9 && imc < 34.9) {
        _stateInfo = 'Obesidade grau I (${imc.toStringAsPrecision(2)})';
      } else if (imc >= 34.9 && imc < 39.9) {
        _stateInfo = 'Obesidade grau II (${imc.toStringAsPrecision(2)})';
      } else if (imc >= 40) {
        _stateInfo = 'Obesidade grau III (${imc.toStringAsPrecision(2)})';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Calculadora de IMC',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: [
            IconButton(
              onPressed: _resetFields,
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .stretch, //vai ocupar toda a largura vertical da tela
                  children: [
                    const Icon(
                      Icons.person_outline,
                      size: 100,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: 'Peso em (Kg)',
                          labelStyle: TextStyle(color: Colors.green),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          focusColor: Colors.green,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      style: const TextStyle(color: Colors.green),
                      controller: weightController,
                      validator: (String? value) {
                        if(value == null || value.isEmpty){
                        return 'Insira seu peso';

                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: 'Altura (cm)',
                          labelStyle: TextStyle(color: Colors.green),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          focusColor: Colors.green,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      style: const TextStyle(color: Colors.green),
                      controller: heightController,
                      validator: (String? value) {
                        if(value == null || value.isEmpty){
                        return 'Insira sua altura';

                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                            _calculated();
                          }
                        },
                        child: Text(
                          'Calcular',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll<Color>(
                                    Colors.green),
                            shape: MaterialStatePropertyAll<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3)))),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _stateInfo,
                      style: TextStyle(color: Colors.green, fontSize: 17),
                    )
                  ]),
            )));
  }
}
