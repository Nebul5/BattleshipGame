#include "Game.h"
#include <typeinfo>

// Game ctr with default ships and point totals
Game::Game() {
	pointTotal[0] = 100;
	pointTotal[1] = 100;
	selectedPlayer = 0;
	gameOver = false;
	turn = 0;

	attack low(4, 0, 0);
	attack medium(6, 0, 0);
	attack powerful(6, 2, 0);
	attack torpedo(8, 0, 0);
	attack planes(4, 0, 1);

	onSwitch = []() {};
	onGameOver = []() {};

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
	gameOver = false;
	turn = 0;

	onSwitch = []() {};
	onGameOver = []() {};

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

		// Set the ships destructor to change our ID base
		Ship_UID ID = IDB.add(selectedPlayer, boards[selectedPlayer].size());
		getShip(ID).setDestroy([ID, this]() {
			destroyShip(ID);
		});
		if (moveShip(ID, x, y)) {
			// Subtract the cost, we can legally add the ship
			pointTotal[selectedPlayer] -= shipTypes[ship].GetCost();
			return ID;
		}
		// destroy the ship and return, placement was illegal
		destroyShip(ID);
		return 0;
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
	onSwitch();
}

// getBoard
std::vector<Ship> & Game::getBoard() {
	return boards[selectedPlayer];
}

// shoot
std::vector<shot> & Game::shoot(Ship_UID s, std::size_t x, std::size_t y) {
	shot newShot(x, y, boards[!selectedPlayer], getShip(s).getAttack());
	shotsFired.addShot(newShot);
	if (boards[!selectedPlayer].size() == 0) {
		gameOver = true;
		onGameOver();
	}
	return shotsFired.current();
}

// printBoard
void Game::printBoard() {
	draw_board(boards[selectedPlayer]);
}

// currentPlayer
int Game::currentPlayer() {
	return (int)selectedPlayer + 1;
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
void Game::registerGameOver(std::function<void()> endFn) {
	onGameOver = endFn;
}

// registerOnSwitch
void Game::registerOnSwitch(std::function<void()> switchFn) {
	onSwitch = switchFn;
}

// nextTurn
void Game::nextTurn() {
	shotsFired.newTurn();
	turn++;
}

// moveShip
bool Game::moveShip(Ship_UID s, std::size_t x, std::size_t y) {
	int x_origin = getShip(s).GetX();
	int y_origin = getShip(s).GetY();
	getShip(s).Move(x, y);
	if (isLegalPlacement(IDB.index(s))) {
		return true;
	}
	else {
		getShip(s).Move(x_origin, y_origin);
		return false;
	}
}

// rotateShip
bool Game::rotateShip(Ship_UID s) {
	getShip(s).Rotate();
	if (isLegalPlacement(IDB.index(s))) {
		return true;
	}
	else {
		getShip(s).Rotate();
		return false;
	}
}

// isLegalPlacement
bool Game::isLegalPlacement(int index) {
	Ship s = boards[selectedPlayer][index];
	bool legal = true;
	int front, back;
	int len = s.Length()/2;
	bool orient = (s.Orientation() == "horizontal");

	if (orient) {
		front = s.GetX() + len;
		back = s.GetX() - len;
	}
	else {
		front = s.GetY() + len;
		back = s.GetY() - len;
	}

	// Adjust for even length ships
	if (!(s.Length() % 2)) {
		front--;
	}

	if ((front > 9) || (back < 0)) {
		std::cout << "Not legal!" << std::endl;
		return false;
	}

	for (int i = 0; i < boards[selectedPlayer].size(); i++) {
		if (i != index) {
			Ship b = boards[selectedPlayer][i];
			int b_len = b.Length() / 2;
			int b_back, b_front;
			if (b.Orientation() == "horizontal") {
				b_front = b.GetX() + b_len;
				b_back = b.GetX() - b_len;

				// Adjust for even length ships
				if (!(b.Length() % 2)) {
					b_front--;
				}

				if (orient) {
					legal = ((front < b_back) || (back > b_front) || (s.GetY() != b.GetY()));
				}
				else {
					legal = ((s.GetX() > b_front) || (s.GetX() < b_back) || (front < b.GetY()) || (back > b.GetY()));
				}
			}
			else {
				b_front = b.GetY() + b_len;
				b_back = b.GetY() - b_len;

				// Adjust for even length ships
				if (!(b.Length() % 2)) {
					b_front--;
				}

				if (orient) {
					legal = ((b.GetX() > front) || (b.GetX() < back) || (b_front < s.GetY()) || (b_back > s.GetY()));
				}
				else {
					legal = ((b_front < back) || (b_back > front) || (s.GetX() != b.GetX()));
				}
			}

			if (!legal) {
				std::cout << "Not legal!" << std::endl;
				break;
			}
		}
	}
	return legal;
}