#include "Game.h"
#include <typeinfo>

// Game ctr with default ships and point totals
Game::Game() {
	pointTotal[0] = 100;
	pointTotal[1] = 100;
	selectedPlayer = 0;
	turn = 0;

	attack low(4, 0, 0);
	attack medium(6, 0, 0);
	attack powerful(6, 2, 0);
	attack torpedo(8, 0, 0);
	attack planes(4, 0, 1);


	// name, hitpoints, armor, length, speed, cost, stealth, onDestroy, attack

	Ship destroyer("destroyer", 9, 2, 2, 4, 10, false, [](){}, low);
	shipTypes.push_back(destroyer);

	Ship cruiser("cruiser", 15, 2, 3, 4, 15, false, [](){}, medium);
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

// Game ctr, with custom ships and point totals
Game::Game(std::vector<Ship> & Types, int Points) {
	shipTypes = Types;
	pointTotal[0] = Points;
	pointTotal[1] = Points;
	selectedPlayer = 0;
	turn = 0;

	std::vector<Ship> boardOne;
	boards.push_back(boardOne);
	std::vector<Ship> boardTwo;
	boards.push_back(boardTwo);
}

// addShip
Ship_UID Game::addShip(std::size_t ship, std::size_t x, std::size_t y) {
	if (shipTypes[ship].GetCost()<=pointTotal[selectedPlayer]) {

		// Copy the ship from our prebuilt types
		boards[selectedPlayer].push_back(Ship(shipTypes[ship]));

		// Subtract the cost from the player and move the ship to the proper location
		pointTotal[selectedPlayer]-=shipTypes[ship].GetCost();
		boards[selectedPlayer][boards[selectedPlayer].size() - 1].Move(x, y);

		// Set the ships destructor to change our ID base
		Ship_UID ID = IDB.add(selectedPlayer, boards[selectedPlayer].size());
		getShip(ID).setDestroy([ID, this]() {
			destroyShip(ID);
		});
		return ID;
	}
	else {
		return 0;
	}
}

// getShip
Ship & Game::getShip(int UID) {
	auto addr = IDB[UID];
	bool plr = std::get<0>(addr);
	Ship_ID ID = std::get<1>(addr);
	if (ID) {
		return boards[plr][ID-1];
	}
	else {
		std::cout << "No such ship";
	}
}

// destroyShip
void Game::destroyShip(Ship_UID ID) {
	bool plr = std::get<0>(IDB[ID]);
	int id = std::get<1>(IDB[ID]) - 1;
	boards[plr].erase(boards[plr].begin()+id);
	IDB.destroy(ID);
}

// switchPlayer
void Game::switchPlayer() {
	selectedPlayer = !selectedPlayer;
	shotsFired.player = selectedPlayer;
}

// getBoard
std::vector<Ship> & Game::getBoard() {
	return boards[selectedPlayer];
}

// shoot
std::vector<shot> & Game::shoot(Ship_UID s, std::size_t x, std::size_t y) {
	shot newShot(x, y, boards[!selectedPlayer], getShip(s).getAttack());
	shotsFired.addShot(newShot);
	return shotsFired.current();
}

// printBoard
void Game::printBoard() {
	draw_board(boards[selectedPlayer]);
}

// printEnemy
void Game::printEnemy() {
	draw_enemy(boards[!selectedPlayer], shotsFired.current());
}

// ships
int Game::shipsRemaining() {
	return boards[selectedPlayer].size();
}

// pointTotals
std::string Game::pointTotals() {
	return "Player one: " + std::to_string(pointTotal[selectedPlayer]) + " Player two: " + std::to_string(pointTotal[!selectedPlayer]);
}

// registerGameOver
void Game::registerGameOver(std::function<void()> end) {
	onGameOver = end;
}

bool Game::moveShip(Ship_UID s, std::size_t x, std::size_t y) {
	// TODO
	return 0;
}

bool Game::rotateShip(Ship_UID s) {
	// TODO
	return 0;
}

bool Game::isLegalPlacement(Ship & s) {
	// TODO
	return 0;
}