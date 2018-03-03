// ************************* //
//      Game_Main.cpp        //
//  for testing Game Objects //
//      by Jake Conner		 //
// ************************* //

#include <iostream>
#include <string>
#include "Ship.h"
#include "draw_board.h"
#include <vector>
#include <tuple>
#include "Game.h"

struct PlayerNum {
	int player;
	PlayerNum() {
		player = 1;
	}

	operator int() {
		return player;
	}

	void Switch() {
		if (player == 2) {
			player = 1;
		}
		else {
			player = 2;
		}
	}
};

int main() {
	Game newGame;
	std::string cmd, tar, X, Y;
	std::vector<std::vector<Ship_UID>> ships(2);
	std::string state = "setup";
	PlayerNum player;
	newGame.registerOnSwitch([&player]() {
		player.Switch();
	});
	newGame.registerGameOver([&state]() {
		state = "game over";
	});
	while (true) {
		newGame.printCommandView();

		if (state == "setup") {
			std::cout << "\nPoints Remaining : " << newGame.pointsLeft() << std::endl;
			for (int i = 0; i < ships[player-1].size(); i++) {
				std::cout << "IDno " << ships[player-1][i] << " : " << newGame.getShip(ships[player - 1][i]).GetName() << std::endl;
			}
			std::cout << std::endl;

			std::cin >> cmd;
			if (cmd == "add") {
				std::cin >> tar >> X >> Y;
				int x = std::stoi(X);
				int y = std::stoi(Y);
				Ship_UID ID;
				if (tar == "battleship") {
					ID = newGame.addShip(SHIPS::BATTLESHIP, x, y);
				}
				else if (tar == "cruiser") {
					ID = newGame.addShip(SHIPS::CRUISER, x, y);
				}
				else if (tar == "destroyer") {
					ID = newGame.addShip(SHIPS::DESTROYER, x, y);
				}
				else if (tar == "aircraft") {
					ID = newGame.addShip(SHIPS::AIRCRAFT_CARRIER, x, y);
				}
				else if (tar == "submarine") {
					ID = newGame.addShip(SHIPS::SUBMARINE, x, y);
				}
				else {
					std::cout << "No such ship \"" << tar << "\"" << std::endl;
				}

				if (ID) {
					ships[player-1].push_back(ID);
				}
				else {
					std::cout << "Failed to add ship" << std::endl;
				}
			}
			else if (cmd == "rotate") {
				std::cin >> tar;
				Ship_UID id = std::stoi(tar);
				newGame.rotateShip(id);
			}
			else if (cmd == "done") {
				if (player == 1) {
					newGame.switchPlayer();
				}
				else {
					state = "play";
					newGame.switchPlayer();
					newGame.startGame();
				}
			}
		}
		else if (state == "play") {
			std::cout << "Player " << std::to_string(player) << "\'s turn" << std::endl;
			for (int i = 0; i < ships[player - 1].size(); i++) {
				std::cout << "IDno " << ships[player - 1][i] << " : " << newGame.getShip(ships[player - 1][i]).Report() << std::endl;
			}
			std::cout << std::endl;

			std::cin >> cmd;
			if (cmd == "shoot") {
				std::cin >> tar >> X >> Y;
				int x = std::stoi(X);
				int y = std::stoi(Y);
				Ship_UID id = std::stoi(tar);
				newGame.shoot(id, x, y);
			}
			else if (cmd == "move") {
				std::cin >> tar >> X >> Y;
				int x = std::stoi(X);
				int y = std::stoi(Y);
				Ship_UID id = std::stoi(tar);
				newGame.travel(id, x, y);
			}
			else if (cmd == "pass") {
				newGame.nextTurn();
			}
		}
		else if (state == "game over") {
			std::cout << "\n GAME OVER!";
		}
	}
}