//Código utilizado no Trabalho de Conclusão de Curso de Engenharia Elétrica na Universidade Federal do Amapá
//Allan Guilherme Lima Pena - allgui9696@gmail.com
//Este código é referente ao esquema da Figura B-2 do trabalho escrito
import processing.serial.*; //Biblioteca para comunicação serial com o microcontrolador
Serial mySerial;           //Função da comunicação serial
PrintWriter output;       //Função utilizada para escrever os dados no arquivo criado

void setup() {
  String portName = Serial.list()[0];           //Identifica a porta serial e define uma variável para esse valor
                                                //IMPORTANTE: Se houver algum erro, mudar o valor entre corchetes de [0] para [1],
                                                //ou [2], ou [3]. Esse é o número da porta serial (entrada USB) que está sendo 
                                                //utilizada.
                                                
  mySerial = new Serial(this, portName, 9600); //Configura a comunicação serial para a porta serial correta.
                                               //IMPORTANTE: A velocidade da comunicação serial deve ser a mesma utilizada no código
                                               //do microcontrolador.
                                               
  output = createWriter( "Teste PID3.txt" );   //Cria o arquivo de formato .txt onde serão armazenados os valores lidos na porta serial.
}

void draw() { 
  if (hour()>=6){ //Lê a hora do computador. Se for maior ou igual a 6, dá início ao bloco de comandos abaixo
                  //IMPORTANTE: A hora do computador deve estar correta. A função hour() depende dela.
                  
  if (mySerial.available() > 0 ) { //Se receber um valor na porta serial, executa os comandos abaixo.
  
    String value = mySerial.readStringUntil('\n'); //Lê o valor recebido na porta serial.
 
    if (value != null ) {   // Se o valor não for nulo, executa os comandos abaixo.
    
      output.print(hour()); //Escreve no arquivo as horas e os minutos atuais seguido do valor lido pelo sensor
      output.print(":");
      output.print(minute());
      output.print(":");
      output.print(second());
      output.print(" ");
      output.print(value);
    }
  }
  }
}
