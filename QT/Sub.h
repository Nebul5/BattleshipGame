#pragma once
#include <string>
using std::string;
#include <iostream>
using std::cout;
using std::endl;
#include "Ship.h"
class Sub : public Ship {

private:
    attack attackInfo = attack(5,5,5);

public:


    Sub(string name) : Ship(name,10, 20, 3, 1, true, []() {cout << "Battleship destroyed!" << endl; },attackInfo) {

    }

	// damage member function, for doing damage to the ship

};
