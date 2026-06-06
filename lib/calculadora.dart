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
    List<String> calculo = [];


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
              boton('C'), boton('CE'), botonOperaciones('%'), botonOperaciones('/')
            ],
          ),
          SizedBox(height: 5,),
          Row(
            spacing: 8,
            children: [
              boton('7'), boton('8'), boton('9'), botonOperaciones('*')
            ],
          ),
          SizedBox(height: 5,),
          Row(
            spacing: 8,
            children: [
            boton('4'), boton('5'), boton('6'), botonOperaciones('-')
            ],
          ),
          SizedBox(height: 5,),
          Row(
            spacing: 8,
            children: [
            boton('1'), boton('2'), boton('3'), botonOperaciones('+')
            ],
          ),
          SizedBox(height: 5,),
          Row(
            spacing: 8,
            children: [
            boton('Exp'), boton('0'), boton('.'), botonOperaciones('=')
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

      case "=":
      if (numeroActual.isNotEmpty) {
            elementos.add(numeroActual);
          }

          calculo = List.from(elementos);
          bool hayOperadores = true;

          while (hayOperadores) {
            hayOperadores = false;

            for (int i = 0; i < calculo.length; i++) {
              if (calculo[i] == "*" || calculo[i] == "/") {
                double a = double.parse(calculo[i - 1]);
                double b = double.parse(calculo[i + 1]);

                double r = 0;

                if (calculo[i] == "*") {
                  r = a * b;
                } else {
                  r = a / b;
                }

                calculo.replaceRange(i - 1, i + 2, [r.toString()]);

                hayOperadores = true;

                break;
              }
            }
          }

          double total = double.parse(calculo[0]);
          for (int i = 1; i < calculo.length; i += 2) {
            String operador = calculo[i];

            double numero = double.parse(calculo[i + 1]);

            switch (operador) {
              case "+":
                total += numero;
                break;

              case "-":
                total -= numero;
                break;
            }
          }

          resultado = total.toString();

          elementos.clear();

          numeroActual = resultado;

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
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 11, 60, 194), // Color de fondo
        foregroundColor: Colors.white, // Color del texto
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
      ),
      child: Text(texto),
    ),
  );
}

Widget botonOperaciones(String texto) {
  return Expanded(
    child: ElevatedButton(
      onPressed: (){ actionButon(texto);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 103, 7, 212), // Color de fondo
        foregroundColor: Colors.white, // Color del texto
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
      ),
      child: Text(texto),
    ),
  );
}
}