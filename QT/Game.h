#ifndef Game_H_INCLUDED
#define Game_H_INCLUDED

#pragma once
#include "draw_board.h"
#include "Ship.h"
#include <vector>

typedef std::size_t Ship_ID;
enum SHIPS { DESTROYER, CRUISER, BATTLESHIP, SUBMARINE, AIRCRAFT_CARRIER };

class Game {
private:
	int pointTotal[2];
	bool selectedPlayer;
	std::vector<std::vector<Ship>> boards;
	std::vector<Ship> shipTypes;

public:
	Game();

	Ship_ID addShip(std::size_t ID, std::size_t x, std::size_t y); // Add a ship to the board, return its ID if successful, 0 otherwise
	Ship & getShip(Ship_ID ID); // Returns the ship with the given ID
	void switchPlayer();
	std::vector<Ship> & getBoard();
    bool moveShip(const int &id, const int &x, const int &y);
};

#endif
