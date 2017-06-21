#include<stdio.h>

//#include"biblioteca/tudo.h"
#include<tudo.h>

int main(int argc, char const *argv[]) {
  char tipo;
  printf("Aceleracao %d m/s²\n",aceleracao(5,10,5) );
  printf("deslocamento %d m\n",deslocamento(10,5,2,2) );
  printf("Torriceli %d mU\n", deslocamentoU(10,5,2));
  printf("Velocidade Media %dm/s\n",velocidade_Media(0,10,5) );



  return 0;
}
