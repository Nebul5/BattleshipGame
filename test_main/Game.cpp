#include "Game.h"

Game::Game() {
	pointTotal[0] = 100;
	pointTotal[1] = 100;
	selectedPlayer = 0;

	attack guns(6, 0, 0);
	attack powerful(6, 2, 0);
	attack torpedo(8, 0, 0);
	attack planes(4, 0, 1);

	// name, hitpoints, armor, length, speed, cost, stealth, onDestroy, attack

	Ship destroyer("destroyer", 10, 0, 2, 4, 10, false, [](){}, guns);
	shipTypes.push_back(destroyer);

	Ship cruiser("cruiser", 15, 2, 3, 4, 15, false, [](){}, guns);
	shipTypes.push_back(cruiser);

	Ship battleship("battleship", 20, 3, 4, 3, 20, false, [](){}, powerful);
	shipTypes.push_back(battleship);

	Ship submarine("submarine", 5, 0, 3, 3, 15, true, [](){}, torpedo);
	shipTypes.push_back(submarine);

	Ship aircraftCarrier("aircraft carrier", 18, 0, 5, 2, 30, false, [](){}, planes);
	shipTypes.push_back(aircraftCarrier);

	std::vector<Ship> boardOne;
	boards.push_back(boardOne);
	std::vector<Ship> boardTwo;
	boards.push_back(boardTwo);
}

Game::Game(std::vector<Ship> & Types, int Points) {
	shipTypes = Types;
	pointTotal[0] = Points;
	pointTotal[1] = Points;

	std::vector<Ship> boardOne;
	boards.push_back(boardOne);
	std::vector<Ship> boardTwo;
	boards.push_back(boardTwo);
}

Ship_ID Game::addShip(std::size_t ship, std::size_t x, std::size_t y) {
	if (shipTypes[ship].GetCost()<=pointTotal[selectedPlayer]) {
		boards[selectedPlayer].push_back(Ship(shipTypes[ship]));
		pointTotal[selectedPlayer]-=shipTypes[ship].GetCost();
		boards[selectedPlayer][boards[selectedPlayer].size() - 1].Move(x, y);
		return boards[selectedPlayer].size();
	}
	else {
		return 0;
	}
}

Ship & Game::getShip(Ship_ID ID) {
	if (ID) {
		return boards[selectedPlayer][ID-1];
	}
	else {
		throw("No such ship on the board, make sure it was added successfully");
	}
}

void Game::switchPlayer() {
	selectedPlayer = !selectedPlayer;
}

std::vector<Ship> & Game::getBoard() {
	return boards[selectedPlayer];
}