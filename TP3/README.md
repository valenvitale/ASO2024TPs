1a. Lo que puedo notar con respecto al tiempo de ejecución es que con hilos tarda menos mientras que sin hilos tarda más. Resulta previsible, ya que al utilizar hilos en la ejecución del código, este se procesa de manera más eficiente al poder abordar multiples tareas simultáneamente.
b. Habiendo comparado con un compañero, hemos observado que el que contiene hilos tarda alrededor de 4 segundos, mientras que el que no los contiene tarda aproximadamente 5.
c. Lo que paso es que cuando incluia los comentarios tardaba alrededor de 0 segundos, y cuando borro los comentarios y lo ejecuto tarda casi 10 segundos.

2a.
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#define NUMBER_OF_THREADS 2
#define CANTIDAD_INICIAL_HAMBURGUESAS 20
int cantidad_restante_hamburguesas = CANTIDAD_INICIAL_HAMBURGUESAS;
int turno = 0;


void *comer_hamburguesa(void *tid)
{
	while (1 == 1)
	{ 
		while(turno!=(int)tid);
		
    // INICIO DE LA ZONA CRÍTICA
		if (cantidad_restante_hamburguesas > 0)
		{
			printf("Hola! soy el hilo(comensal) %d , me voy a comer una hamburguesa ! ya que todavia queda/n %d \n", (int) tid, cantidad_restante_hamburguesas);
			cantidad_restante_hamburguesas--; // me como una hamburguesa
		}
		else
		{
			printf("SE TERMINARON LAS HAMBURGUESAS :( \n");

			pthread_exit(NULL); // forzar terminacion del hilo
		}
    // SALIDA DE LA ZONA CRÍTICA 
	turno = (turno + 1)% NUMBER_OF_THREADS;
	}
}

int main(int argc, char *argv[])
{
	pthread_t threads[NUMBER_OF_THREADS];
	int status, i, ret;
	for (int i = 0; i < NUMBER_OF_THREADS; i++)
	{
		printf("Hola!, soy el hilo principal. Estoy creando el hilo %d \n", i);
		status = pthread_create(&threads[i], NULL, comer_hamburguesa, (void *)i);
		if (status != 0)
		{
			printf("Algo salio mal, al crear el hilo recibi el codigo de error %d \n", status);
			exit(-1);
		}
	}

	for (i = 0; i < NUMBER_OF_THREADS; i++)
	{
		void *retval;
		ret = pthread_join(threads[i], &retval); // espero por la terminacion de los hilos que cree
	}
	pthread_exit(NULL); // como los hilos que cree ya terminaron de ejecutarse, termino yo tambien.
}

2b. <img src-"./2b.png"> 