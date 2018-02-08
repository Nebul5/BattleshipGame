// ************************* //
//         Main.cpp          //
//  for testing Ship class   //
//      by Jake Conner		 //
// ************************* //

#include <iostream>
#include <string>
#include "Ship.h"

using std::cout;
using std::endl;

int main(){
	
	bool keep_shooting = true;

	// Make an attack and a new ship
	attack barrage(5, 2, 3);
	Ship boaty(10, 4, 4, 4, false, [&keep_shooting]() { keep_shooting = false; }, barrage);

	// Keep shooting until it dies
	while (keep_shooting) {
		cout << "Boaty has: " << boaty.report() << endl;
		boaty.damage(barrage);
	}

	// We got out of the loop if we're here.
	cout << "done" << endl;
	std::cin.get();

    return 0;
}