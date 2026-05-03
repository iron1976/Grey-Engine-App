#include <iostream>     
#include "Core/Application/Application.h"  
int main()
{
	GreyEngine::Application app;
	app.CreateWindow(800, 600, "Grey Engine");
	app.Start(); 
	return 0;
}
