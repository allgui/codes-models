//Código utilizado no Trabalho de Conclusão de Curso de Engenharia Elétrica na Universidade Federal do Amapá
//Allan Guilherme Lima Pena
float pinoSensorLuz = A0; //Define a porta analógica que fará a leitura do sensor LDR
float valorLuz = 0;      //Variável que armazena os valores lidos pela porta analógica
float valor;            //Variável que armazena os valores convertidos

void setup()
{
Serial.begin(9600); //Inicia a comunicação serial
}

void loop()
{
  valorLuz = analogRead(pinoSensorLuz); //Comando para ler o valor da porta analógica e
                                       //armazeno-lo na variável definida
 
  valor = map(valorLuz,0,1023,0,100); //Converte o valor da porta analógica (que varia de 0 a 1023)
                                     //para um valor de 0 a 100
  
  Serial.println(valor); //Escreve o valor obtido após a conversão no porta serial
  
  delay(18); //Aguarda 18 milisegundos para repetir este processo
}
