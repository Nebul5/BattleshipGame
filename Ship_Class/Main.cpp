#define CATCH_CONFIG_MAIN  // This tells Catch to provide a main() - only do this in one cpp file
#include "catch.hpp"

// ************************* //
//         Main.cpp          //
//  for testing Ship class   //
//      by Jake Conner		 //
// ************************* //

#include <iostream>
#include <string>

#include "Battleship.h"
#include "Sub.h"
#include "Destroyer.h"
#include "Cruiser.h"
#include "Carrier.h"

#include "catch.hpp"
using std::cout;
using std::endl;


TEST_CASE("Testing BattleShip Creation", "[ships]") {
	Battleship ship;
	REQUIRE(ship.getHP() == 10);
	REQUIRE(ship.getArmor() == 20);
	REQUIRE(ship.getLength() == 5);
	REQUIRE(ship.getSpeed() == 3);
	REQUIRE(ship.getStealth() == 0);
	REQUIRE(ship.isTracked() == false);
}
TEST_CASE("Testing Sub Creation", "[ships]") {
	Sub ship;
	REQUIRE(ship.getHP() == 10);
	REQUIRE(ship.getArmor() == 20);
	REQUIRE(ship.getLength() == 5);
	REQUIRE(ship.getSpeed() == 3);
	REQUIRE(ship.getStealth() == 0);
	REQUIRE(ship.isTracked() == false);
}
TEST_CASE("Testing Carrier Creation", "[ships]") {
	Carrier ship;
	REQUIRE(ship.getHP() == 10);
	REQUIRE(ship.getArmor() == 20);
	REQUIRE(ship.getLength() == 5);
	REQUIRE(ship.getSpeed() == 3);
	REQUIRE(ship.getStealth() == 0);
	REQUIRE(ship.isTracked() == false);
}
TEST_CASE("Testing Destroyer Creation", "[ships]") {
	Destroyer ship;
	REQUIRE(ship.getHP() == 10);
	REQUIRE(ship.getArmor() == 20);
	REQUIRE(ship.getLength() == 5);
	REQUIRE(ship.getSpeed() == 3);
	REQUIRE(ship.getStealth() == 0);
	REQUIRE(ship.isTracked() == false);
}

TEST_CASE("Testing Cruiser Creation", "[ships]") {
	Cruiser ship;
	REQUIRE(ship.getHP() == 10);
	REQUIRE(ship.getArmor() == 20);
	REQUIRE(ship.getLength() == 5);
	REQUIRE(ship.getSpeed() == 3);
	REQUIRE(ship.getStealth() == 0);
	REQUIRE(ship.isTracked() == false);
}
