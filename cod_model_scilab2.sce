//Código utilizado no Trabalho de Conclusão de Curso de Engenharia Elétrica na Universidade Federal do Amapá
//Allan Guilherme Lima Pena - allgui9696@gmail.com
//Quaisquer dúvidas entrar em contato ou utilizar a função "help"
//Este código é referente ao esquema da Figura B-5 do trabalho escrito

clear //Limpa o Navegador de variáveis
clc   //Lima o Console

[fd,SST,Sheetnames,Sheetpos] = xls_open('diretório do arquivo\arquivo.xls'); // Comando que abre uma planilha de formato .xls 

[Value,TextInd] = xls_read(fd,Sheetpos(1)); //Comando para ler a planilha. A variável Sheetpos define  o número da folha da planilha a ser lida. A variável Value armazena os dados da planilha.

mclose(fd); //Fecha a planilha aberta

//IMPORTANTE: A PLANILHA UTILIZADA DEVE TRABALHAR COM VÍRGULAS PARA SEPARAÇÃO DECIMAL. 
//IMPORTANTE: A PLANILHA UTILIZADA NÃO DEVE POSSUIR FÓRMULAS NAS CÉLULAS LIDAS
//IMPORTANTE: A PLANILHA UTILIZADA NÃO DEVE POSSUIR GRÁFICOS COM AS CÉLULAS LIDAS
//IMPORTANTE: AS PLANILHAS DE FORMATO .xls POSSUEM LIMITES DE LINHAS. PARA FACILITAR O TRABALHO COM MUITOS DADOS, FOI ESTABELECIDO UM MÁXIMO DE 65000 LINHAS.

tempo = Value(1:504,2)/1000; //Variável que armazena o tempo do teste e converte para segundos
lumi = Value(1:504,6); //Variável que armazena os valores de luminosidade
lumi_norma = Value(1:504,8); //Variável que armazena os valores de luminosidade normazlizada
[nl,nc] = size(lumi_norma); //Retorna o número de linhas e colunas do vetor "lumi_norma"

for i=1:nl //Para i igual 1 até i igual a nl (número de linhas do vetor "lumi_norma") faça
    
    ts_inf = 0.9800 * 1; //Variável auxiliar. Corresponde a 98% do valor de regime permanente, que nesse caso é 1
    ts_sup = 1.2000 * 1; //Variável auxiliar. Corresponde a 102% do valor de regime permanente, que nesse caso é 1
    if ((lumi_norma(i,1)>ts_inf)&&(lumi_norma(i,1)<ts_sup)) then //Se o valor de luminosidade normalizada for maior que 98% e menor que 102% do valor de regime permanente, então
        
        ts = tempo(i,1); //Tempo de acomodação encontrado
        break; //Sai do laço
    end  
end

scf(1);
clf(1);
plot(tempo,lumi_norma)
xlabel('Tempo (s)','FontSize','3'); //Legenda no eixo das abscissas
ylabel('Luminosidade Normalizada','FontSize','3'); //Legenda no eixo das ordenadas
title('Faxa de Operação: 0% a 14% - Curva 1 - Luminosidade Externa: 1.5% - Aumento de Luminosidade: 3.22% - Step: 24%','FontSize','3'); ///Legenda no topo do gráfico

a = gca(); //Variável criada para utilizar o manipulador de entidades dos eixos
a.font_size = 3; //A fonte dos números nos eixos fica no tamanho 3
a.tight_limits = "on"; //Os eixos se adaptam para se encaixarem dentro dos valores mínimos e máximos
a.data_bounds = [0,-0.1;9,1.1]; //Define os limites mínimo e máximo do eixo das abscissas e ordenadas
