//Código utilizado no Trabalho de Conclusão de Curso de Engenharia Elétrica na Universidade Federal do Amapá
//Allan Guilherme Lima Pena - allgui9696@gmail.com
//Quaisquer dúvidas entrar em contato ou utilizar a função "help"
//Este código é referente ao esquema da Figura B-4 do trabalho escrito

clear //Limpa o Navegador de variáveis
clc   //Lima o Console

[fd,SST,Sheetnames,Sheetpos] = xls_open('diretório do arquivo\arquivo.xls'); // Comando que abre uma planilha de formato .xls 

[Value,TextInd] = xls_read(fd,Sheetpos(1)); //Comando para ler a planilha. A variável Sheetpos define  o número da folha da planilha a ser lida. A variável Value armazena os dados da planilha.

mclose(fd); //Fecha a planilha aberta

//IMPORTANTE: A PLANILHA UTILIZADA DEVE TRABALHAR COM VÍRGULAS PARA SEPARAÇÃO DECIMAL. 
//IMPORTANTE: A PLANILHA UTILIZADA NÃO DEVE POSSUIR FÓRMULAS NAS CÉLULAS LIDAS
//IMPORTANTE: A PLANILHA UTILIZADA NÃO DEVE POSSUIR GRÁFICOS COM AS CÉLULAS LIDAS
//IMPORTANTE: AS PLANILHAS DE FORMATO .xls POSSUEM LIMITES DE LINHAS. PARA FACILITAR O TRABALHO COM MUITOS DADOS, FOI ESTABELECIDO UM MÁXIMO DE 65000 LINHAS.
//IMPORTANTE: O SCILAB (R) NÃO PLOTA VARIÁVEIS DO TIPO STRING DIRETAMENTE. FOI ELABORADO UM JEITO PARA UTILIZAR AS HORAS/MOMENTOS DAS LEITURAS

ensaio1.time1 = Value(1:65000,2); //Variável "ensaio1" criada para armazenar todos os valores. Foi utilizado o objeto "time1" para definidir qual parte da variável será utilizada. Nesse vaso, esta variável é igual a variável "Value" da linha 1 até a linha 65000 da coluna 2.
ensaio1.time2 = Value(1:65000,9);
ensaio1.time3 = Value(1:65000,16);
ensaio1.time4 = Value(1:29045,23);
ensaio1.time_total = [ensaio1.time1; ensaio1.time2;ensaio1.time3;ensaio1.time4]; //Vetor tempo que junta os vetores de 65000 linhas em apenas um

tempo_horas = [Value(1:65000,4);Value(1:65000,11);Value(1:65000,18);Value(1:29045,25)];//Vetor criado para trabalhar com as horas lidas

ensaio1.value_L1 = Value(1:65000,6); // Objeto "value_L1" é o primeiro vetor dos dados de luminosidade. Variável igual a "Value" da linha 1 até a linha 65000, da coluna 6.
ensaio1.value_L2 = Value(1:65000,13);
ensaio1.value_L3 = Value(1:65000,20);
ensaio1.value_L4 = Value(1:29045,27);
ensaio1.valueL_total = [ensaio1.value_L1; ensaio1.value_L2;ensaio1.value_L3;ensaio1.value_L4]; //Vetor de luminosidade que junta os vetores de 65000 linhas em apenas um

scf(1); //Ajusta a janela gráfica para o plot utilizado 
clf(1); //Apaga a janela gráfica caso haja algum plot antes deste

plot(ensaio1.time_total, ensaio1.valueL_total) //Plota a luminosidade em função do tempo
xgrid() //Grade de linhas 
xlabel('Tempo','FontSize','3'); //Legenda no eixo das abscissas
ylabel('Luminosidade (%)','FontSize','3'); //Legenda no eixo das ordenadas
title('Ensaio de Luminosidade - 6h às 18h30 - 01/01/2021','FontSize','3'); //Título no topo do gráfico

//Comandos para inserir as horas no eixo das abscissas

tempo = datevec(tempo_horas); //Transforma o vetor tempo_horas em um vetor de data/hora reconhecido pelo Scilab (R)

tempo = string(tempo(:,4:6)); //Transforma a linha anterior em valores do tipo string

hora = tempo(:,1)+":"; //Organiza a primeira coluna do vetor tempo como horas
minut = tempo(:,2)+":"; //Organiza a primeira coluna do vetor tempo como minutos
seg = tempo(:,3); //Organiza a primeira coluna do vetor tempo como segundos
tempo_total = hora+minut+seg; //Junta os vetores pra completar um  vetor de strings de formato hora:minuto:segundo

[nl,nc] = size(tempo); //Retorna o número de linhas e colunas do vetor "tempo"

c = floor(nl/15); //Salva o valor arredondado (para baixo) do número de divisões que serão inseridas no eixo das abscissas

locais = [ensaio1.time_total(1);ensaio1.time_total(c);ensaio1.time_total(2*c);ensaio1.time_total(3*c);ensaio1.time_total(4*c);ensaio1.time_total(5*c);ensaio1.time_total(6*c);ensaio1.time_total(7*c);ensaio1.time_total(8*c);ensaio1.time_total(9*c);ensaio1.time_total(10*c);ensaio1.time_total(11*c);ensaio1.time_total(12*c);ensaio1.time_total(13*c);ensaio1.time_total(14*c);ensaio1.time_total(15*c)]; //Vetor das posições onde serão inseridas as horas no eixo X

a = gca(); //Variável criada para utilizar o manipulador de entidades dos eixos
a.font_size = 3; //A fonte dos números nos eixos fica no tamanho 3
a.tight_limits = "on"; //Os eixos se adaptam para se encaixarem dentro dos valores mínimos e máximos
passo=a.x_ticks; //Variável criada para trabalhar com o comando x_ticks, que define onde no eixo das abscissas serão inseridas os valores das horas e quais valores são esses

passo.locations=locais; //É uma dos campos utilizados pelo comando x_ticks. Define onde serão inseridos os valores

horas = [tempo_total(1);tempo_total(c);tempo_total(2*c);tempo_total(3*c);tempo_total(4*c);tempo_total(5*c);tempo_total(6*c);tempo_total(7*c);tempo_total(8*c);tempo_total(9*c);tempo_total(10*c);tempo_total(11*c);tempo_total(12*c);tempo_total(13*c);tempo_total(14*c);tempo_total(15*c)] //Vetor contendo as horas que serão inseridas nas posições definidas pelo vetor "locais"

//IMPORTANTE: LOCATIONS E LABELS DEVEM TER TAMANHOS IGUAIS

passo.labels=horas; //Define o campo "labels" como sendo o vetor "horas"
a.x_ticks=passo;
