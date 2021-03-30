//Código utilizado no Trabalho de Conclusão de Curso de Engenharia Elétrica na Universidade Federal do Amapá
//Allan Guilherme Lima Pena - allgui9696@gmail.com
//Quaisquer dúvidas entrar em contato ou utilizar a função "help"
//Este código é referente ao esquema da Figura B-6 do trabalho escrito

clear() //Limpa o Navegador de variáveis
clc()  //Lima o Console

[fd,SST,Sheetnames,Sheetpos] = xls_open('C:\Users\all_g\Dropbox\adaptativecontrol-TCC2\TCC2\data\Levantamento de Curvas\PIDparameters.xls'); // Comando que abre uma planilha de formato .xls 

[Value,TextInd] = xls_read(fd,Sheetpos(1)); //Comando para ler a planilha. A variável Sheetpos define  o número da folha da planilha a ser lida. A variável Value armazena os dados da planilha.

mclose(fd); //Fecha a planilha aberta

//IMPORTANTE: A PLANILHA UTILIZADA DEVE TRABALHAR COM VÍRGULAS PARA SEPARAÇÃO DECIMAL. 
//IMPORTANTE: A PLANILHA UTILIZADA NÃO DEVE POSSUIR FÓRMULAS NAS CÉLULAS LIDAS
//IMPORTANTE: A PLANILHA UTILIZADA NÃO DEVE POSSUIR GRÁFICOS COM AS CÉLULAS LIDAS
//IMPORTANTE: AS PLANILHAS DE FORMATO .xls POSSUEM LIMITES DE LINHAS. PARA FACILITAR O TRABALHO COM MUITOS DADOS, FOI ESTABELECIDO UM MÁXIMO DE 65000 LINHAS.

po = Value(6:23,4); //Vetor dos pontos de operação
f1 = Value(6:8,7:9); //Vetor dos valores da Faixa 1 (0 - 14)
f2 = Value(9:11,7:9); //Vetor dos valores da Faixa 1 (15 - 29)
f3 = Value(12:14,7:9); //Vetor dos valores da Faixa 1 (30 - 40)
f4 = Value(15:17,7:9); //Vetor dos valores da Faixa 1 (42 - 52)
f5 = Value(18:20,7:9); //Vetor dos valores da Faixa 1 (53 - 62)
f6 = Value(21:23,7:9); //Vetor dos valores da Faixa 1 (63 - 70)

scf(1);
clf(1);
scatter(po(1:3),f1(:,1),"markerEdgeColor",[1 .4 .22],"linewidth",4) //Comando scatter faz plot de gráficos de dispersão. O comando "markerEdgeColo" define as cores dos pontos e o comando "linewidth" é a grossura da linha dos pontos
scatter(po(4:6),f2(:,1),"+","markerEdgeColor",[0.2 .50 .22],"linewidth",4) //O símbolo "+" define o tipo de ponto que aparece no gráfico, assim como os que aparecem abaixo mostram pontos de estilo diferente
scatter(po(7:9),f3(:,1),'x',"markerEdgeColor",[0.5 .50 .22],"linewidth",4)
scatter(po(10:12),f4(:,1),'d',"markerEdgeColor",[0.8 .10 .22],"linewidth",4)
scatter(po(13:15),f5(:,1),'*',"markerEdgeColor",[0.1 .80 .22],"linewidth",4)
scatter(po(16:18),f6(:,1),'s',"markerEdgeColor",[1 0.15 .30],"linewidth",4)
xlabel('Pontos de Operação','FontSize','4');
ylabel('Kp','FontSize','4');
title('Ganho Proporcional das Faixas','FontSize','4');
hl = legend(['0 - 14','15 - 29','30 - 40','42 - 52','53 - 62','63 - 70'],pos=-1); //Legenda inserida para cada vetor plotado. O comando pos=-1 define a posição da caixa de legenda como sendo no lado superior direito do gráfico
b = gce(); //Manipulador de entidade utilizada. Nesse caso, a caixa de legendas
b.font_size = 4; //Tamanho da fonte da caixa de legendas setada para 4

a = gca(); //Variável criada para utilizar o manipulador de entidades dos eixos
a.font_size = 3; //A fonte dos números nos eixos fica no tamanho 3
a.tight_limits = "on"; //Os eixos se adaptam para se encaixarem dentro dos valores mínimos e máximos
a.data_bounds = [0, 0; 70, 8]; //Define os limites mínimo e máximo do eixo das abscissas e ordenadas
a.grid = [-1,1]; //Define que o grid mostrará apenas as linhas horizontais na cor preta. As linhas verticais estão sem cor, definidos pelo comando -1
a.grid_style = [-1 4]; //Define que o grid será feito com linhas no estilo "-.-.-.-"

//O PROCESSO DESCRITO ATÉ AQUI SE REPETE PARA OS OUTROS PLOTS

scf(2);
clf(2);
scatter(po(1:3),f1(:,2),"markerEdgeColor",[1 .4 .22],"linewidth",4)
scatter(po(4:6),f2(:,2),"+","markerEdgeColor",[0.2 .50 .22],"linewidth",4)
scatter(po(7:9),f3(:,2),'x',"markerEdgeColor",[0.5 .50 .22],"linewidth",4)
scatter(po(10:12),f4(:,2),'d',"markerEdgeColor",[0.8 .10 .22],"linewidth",4)
scatter(po(13:15),f5(:,2),'*',"markerEdgeColor",[0.1 .80 .22],"linewidth",4)
scatter(po(16:18),f6(:,2),'s',"markerEdgeColor",[1 0.15 .30],"linewidth",4)
xlabel('Pontos de Operação','FontSize','4');
ylabel('Ti','FontSize','4');
title('Tempo Integrativo das Faixas','FontSize','4');
hl = legend(['0 - 14','15 - 29','30 - 40','42 - 52','53 - 62','63 - 70'],pos=-1);
b = gce();
b.font_size = 4;
a = gca();
a.font_size = 4;
a.tight_limits = "on";
a.grid = [-1,1];
a.grid_style = [-1 4];
a.data_bounds = [-1, 0; 70, 0.2];

scf(3);
clf(3);
scatter(po(1:3),f1(:,3),"markerEdgeColor",[1 .4 .22],"linewidth",4)
scatter(po(4:6),f2(:,3),"+","markerEdgeColor",[0.2 .50 .22],"linewidth",4)
scatter(po(7:9),f3(:,3),'x',"markerEdgeColor",[0.5 .50 .22],"linewidth",4)
scatter(po(10:12),f4(:,3),'d',"markerEdgeColor",[0.8 .10 .22],"linewidth",4)
scatter(po(13:15),f5(:,3),'*',"markerEdgeColor",[0.1 .80 .22],"linewidth",4)
scatter(po(16:18),f6(:,3),'s',"markerEdgeColor",[1 0.15 .30],"linewidth",4)
xlabel('Pontos de Operação','FontSize','4');
ylabel('Td','FontSize','4');

title('Tempo Derivativo das Faixas','FontSize','4');
hl = legend(['0 - 14','15 - 29','30 - 40','42 - 52','53 - 62','63 - 70'],pos=-1);
b = gce();
b.font_size = 4;
a = gca();
a.font_size = 4;
a.tight_limits = "on";
a.grid = [-1,1];
a.grid_style = [-1 4];
a.data_bounds = [-1, 0; 70, 0.06];

