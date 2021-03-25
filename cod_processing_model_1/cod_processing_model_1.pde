//Código utilizado no Trabalho de Conclusão de Curso de Engenharia Elétrica na Universidade Federal do Amapá
//Allan Guilherme Lima Pena - allgui9696@gmail.com
//Para utilizar este código é necessário baixar uma biblioteca para a placa Arduino, carregar o código na placa e só então, utilizar
//o código aqui descrito. O passo a passo pode ser visto no link: https://playground.arduino.cc/Interfacing/Processing/

import processing.serial.*; //Biblioteca para comunicação serial com o microcontrolador
import cc.arduino.*;        //Biblioteca para comunicação com a placa Arduino
Arduino arduino;            //Função de comunicação com a aplaca Arduino
PrintWriter output;         //Função utilizada para escrever os dados no arquivo criado

void setup (){
println(Arduino.list());                                 //Mostra em qual(is) porta(s) está(ão) conectada(as) placa(s) Arduino.

arduino = new Arduino (this, Arduino.list()[0], 57600);  //Configura a comunicação serial para a porta serial correta.
                                                         //IMPORTANTE: A velocidade da comunicação serial deve ser a mesma utilizada no código
                                                         //do microcontrolador.
                                                         
output = createWriter("Hora de ativação.txt");           //Cria o arquivo de formato .txt onde serão armazenados os valores lidos na porta serial.
}

void draw (){
  int s = second(); //Função que lê os segundos do computador
  int m = minute(); //Função que lê os minutos do computador
  int h = hour();   //Função que lê as horas do computador
  
  switch(m){                       //Troca o bloco de comandos de acordo com o caso
    
    case 30:                       //Se os minutos forem iguais a 30
     arduino.analogWrite(6,255);   //Ativa a porta digital PWM 6 da placa no valor máximo (255)
     output.print(h);              //Escreve no arquivo .txt a hora:minuto:segundo atuais seguido da mensagem "Pino PWM Ativado"
     output.print(":"); 
     output.print(m); 
     output.print(":"); 
     output.print(s);
     output.print(" ");
     output.println("Pino PWM ativado");
     break;                         //Sai do bloco de comandos
     
     case 29:                      //Se minutos forem iguais a 29
     output.println("Falta 1 minuto para o início");  //Escreve a mensagem "falta 1 minuto para o início" no arquivo .txt.
     break;                        //Sai do bloco de comandos
     
     case 41:                      //Se minutos forem iguais a 30
     output.println("Ensaio encerrado"); //Escreve a mensagem "Ensaio encerrado" no arquivo .txt
     break;                        //Sai do bloco de comandos
  }
}
