import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState()=> _CalculadoraState();
  
  }
  class _CalculadoraState extends State<Calculadora>{
    String operacion = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('Calculadora')),
      backgroundColor: Colors.black,
      body: SafeArea(child: Column(
        children: [
          Expanded(child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: const Color.fromARGB(255, 12, 4, 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(operacion,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 10,),
                Text(operacion,
                style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),

              ],
              ),
            ),
          ),
          Row(
            spacing: 8,
            children: [
              boton('7'), boton('8'), boton('9')
            ],
          ),
          SizedBox(height: 5,),
          Row(
            spacing: 8,
            children: [
            boton('4'), boton('5'), boton('6')
            ],
          ),
          SizedBox(height: 5,),
          Row(
            spacing: 8,
            children: [
            boton('1'), boton('2'), boton('3')
            ],
          ),
          SizedBox(height: 5,),
          Row(
            spacing: 8,
            children: [
            boton('Exp'), boton('0'), boton('.')
            ],
          )
        ],
        )
      )
    );
  }//build
Widget boton(String texto) {
  return Expanded(
    child: ElevatedButton(
      onPressed: (){},
      child: Text(texto),
    ),
  );
}
  
}