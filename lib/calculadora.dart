import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState()=> _CalculadoraState();
  
  }
  class _CalculadoraState extends State<Calculadora>{


    String operacion = "";
    String resultado = "0";
    String numeroActual = "";
    List<String> elementos = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //appBar: AppBar(title: const Text('Calculadora')),
      backgroundColor: Colors.black,
      body: SafeArea(child: Column(
        children: [
          Expanded(child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(40),
            color: const Color.fromARGB(255, 12, 4, 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(operacion,
                style:  TextStyle(color: Colors.white, fontSize: 20),
                ),
                 SizedBox(height: 10,),
                Text(resultado,
                style:  TextStyle(color: Colors.white, fontSize: 20),
                ),
                

              ],
              ),
            ),
          ),
          Row(
            spacing: 8,
            children: [
              boton('C'), boton('CE'), boton('%'), boton('/')
            ],
          ),
          SizedBox(height: 5,),
          Row(
            spacing: 8,
            children: [
              boton('7'), boton('8'), boton('9'), boton('*')
            ],
          ),
          SizedBox(height: 5,),
          Row(
            spacing: 8,
            children: [
            boton('4'), boton('5'), boton('6'), boton('-')
            ],
          ),
          SizedBox(height: 5,),
          Row(
            spacing: 8,
            children: [
            boton('1'), boton('2'), boton('3'), boton('+')
            ],
          ),
          SizedBox(height: 5,),
          Row(
            spacing: 8,
            children: [
            boton('Exp'), boton('0'), boton('.'), boton('=')
            ],
          )
        ],
        )
      )
    );
  }//build

void actionButon (String valor){
  //print (valor);
  setState(() {
      switch (valor) {
      case 'C':
        operacion = '';
        resultado = '0';
        numeroActual = '';
        elementos.clear();
      break; 
      case  'CE':
      if (operacion.isNotEmpty) {
          operacion = operacion.substring(0, operacion.length - 1);
        }
      
      case '+':
      case '-':
      case '*':
      case '/':
      if(numeroActual.isNotEmpty){
        elementos.add(numeroActual);
        elementos.add(valor);
        numeroActual ="";
        operacion +=valor;
      } 
      print (elementos);

      break;

      default:
        operacion += valor;
        numeroActual += valor;
        }
  });
}

Widget boton(String texto) {
  return Expanded(
    child: ElevatedButton(
      onPressed: (){ actionButon(texto);
      },
      child: Text(texto),
    ),
  );
}
  
}