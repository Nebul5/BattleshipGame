
#include "draw_board.h"

using std::cout;
using std::endl;

// draw_board function
// Pre: ships is a vector of ships placed in valid coordinates within a 10x10 grid.
// Post: Draws an ASCII representation of a game board.
//	Exception neutral
void draw_board(std::vector<Ship> & ships) {
	std::vector<int> row(10, -1);
	std::vector<std::vector<int>> board(10, row);

	// Make the board
	for (int i = 0; i < ships.size(); i++) {
		int bow_stern = ships[i].Length() / 2;

		if (ships[i].Orientation() == "horizontal") {
			for (int ii = 0; ii < ships[i].Length(); ii++) {
				board[ships[i].GetY()][ships[i].GetX() - bow_stern + ii] = i;
			}
		}
		else {
			for (int ii = 0; ii < ships[i].Length(); ii++) {
				board[ships[i].GetY() - bow_stern + ii][ships[i].GetX()] = i;
			}
		}
	}

	// Draw the board
	// TODO: something better than console output here

	for (int i = 0; i < board.size(); i++) {
		for (int ii = 0; ii < board[i].size(); ii++) {

			if (board[i][ii] < 0) {
				cout << " - ";
			}
			else {
				if (ships[board[i][ii]].GetName() == "cruiser") {
					cout << " C ";
				}
				else if (ships[board[i][ii]].GetName() == "battleship") {
					cout << " B ";
				}
				else if (ships[board[i][ii]].GetName() == "destroyer") {
					cout << " D ";
				}
				else if (ships[board[i][ii]].GetName() == "aircraft carrier") {
					cout << " A ";
				}
				else if (ships[board[i][ii]].GetName() == "submarine") {
					cout << " S ";
				}
				else {
					cout << " ? ";
				}
			}
		}
		cout << endl << endl;
	}
	cout << endl;
}

// draw_enemy function
// Pre: ships is a vector of ships placed in valid coordinates within a 10x10 grid.
// Post: Draws an ASCII representation of the enemy's board.
//	Exception neutral
void draw_enemy(std::vector<Ship> & ships, std::vector<shot> & shots) {
	std::vector<int> row(10, -1);
	std::vector<std::vector<int>> board(10, row);

	// Make the board
	for (int i = 0; i < ships.size(); i++) {
		int bow_stern = ships[i].Length() / 2;

		if (ships[i].isVisible()) {
			if (ships[i].Orientation() == "horizontal") {
				for (int ii = 0; ii < ships[i].Length(); ii++) {
					board[ships[i].GetY()][ships[i].GetX() - bow_stern + ii] = i;
				}
			}
			else {
				for (int ii = 0; ii < ships[i].Length(); ii++) {
					board[ships[i].GetY() - bow_stern + ii][ships[i].GetX()] = i;
				}
			}
		}
	}

	for (int i = 0; i < shots.size(); i++) {
		board[shots[i].y_loc][shots[i].x_loc] = -2 - i;
	}

	// Draw the board
	// TODO: something better than console output here

	for (int i = 0; i < board.size(); i++) {
		for (int ii = 0; ii < board[i].size(); ii++) {

			if (board[i][ii] < 0) {
				if (board[i][ii] == -1) {
					cout << " - ";
				}
				else {
					if (shots[-(board[i][ii] + 2)].hit_or_miss) {
						cout << " H ";
					}
					else {
						cout << " M ";
					}
				}
			}
			else {
				if (ships[board[i][ii]].GetName() == "cruiser") {
					cout << " C ";
				}
				else if (ships[board[i][ii]].GetName() == "destroyer") {
					cout << " D ";
				}
				else if (ships[board[i][ii]].GetName() == "battleship") {
					cout << " B ";
				}
				else if (ships[board[i][ii]].GetName() == "aircraft carrier") {
					cout << " A ";
				}
				else if (ships[board[i][ii]].GetName() == "submarine") {
					cout << " S ";
				}
				else {
					cout << " ? ";
				}
			}
		}
		cout << endl << endl;
	}
	cout << endl;
}


// draw command
void draw_command(std::vector<Ship> & a_ships, std::vector<Ship> & e_ships, std::vector<shot> & shots) {
	std::vector<int> row(10, -1);
	std::vector<std::vector<int>> ally_board(10, row);
	std::vector<std::vector<int>> enemy_board(10, row);

	// Make enemy board
	for (int i = 0; i < e_ships.size(); i++) {
		int bow_stern = e_ships[i].Length() / 2;

		if (e_ships[i].isVisible()) {
			if (e_ships[i].Orientation() == "horizontal") {
				for (int ii = 0; ii < e_ships[i].Length(); ii++) {
					enemy_board[e_ships[i].GetY()][e_ships[i].GetX() - bow_stern + ii] = i;
				}
			}
			else {
				for (int ii = 0; ii < e_ships[i].Length(); ii++) {
					enemy_board[e_ships[i].GetY() - bow_stern + ii][e_ships[i].GetX()] = i;
				}
			}
		}
	}

	// Make ally board
	for (int i = 0; i < a_ships.size(); i++) {
		int bow_stern = a_ships[i].Length() / 2;

		if (a_ships[i].Orientation() == "horizontal") {
			for (int ii = 0; ii < a_ships[i].Length(); ii++) {
				ally_board[a_ships[i].GetY()][a_ships[i].GetX() - bow_stern + ii] = i;
			}
		}
		else {
			for (int ii = 0; ii < a_ships[i].Length(); ii++) {
				ally_board[a_ships[i].GetY() - bow_stern + ii][a_ships[i].GetX()] = i;
			}
		}
	}

	for (int i = 0; i < shots.size(); i++) {
		enemy_board[shots[i].y_loc][shots[i].x_loc] = -2 - i;
	}

	// Draw the board
	// TODO: something better than console output here

	cout << "    0  1  2  3  4  5  6  7  8  9    0  1  2  3  4  5  6  7  8  9 " << endl;

	for (int i = 0; i < 10; i++) {

		cout << "R" + std::to_string(i) + " ";

		for (int ii = 0; ii < 22; ii++) {

			if (ii > 11) {
				int adj = ii - 12;
				if (enemy_board[i][adj] < 0) {
					if (enemy_board[i][adj] == -1) {
						cout << " - ";
					}
					else {
						if (shots[-(enemy_board[i][adj] + 2)].hit_or_miss) {
							cout << " H ";
						}
						else {
							cout << " M ";
						}
					}
				}
				else {
					if (e_ships[enemy_board[i][adj]].GetName() == "cruiser") {
						cout << " C ";
					}
					else if (e_ships[enemy_board[i][adj]].GetName() == "destroyer") {
						cout << " D ";
					}
					else if (e_ships[enemy_board[i][adj]].GetName() == "battleship") {
						cout << " B ";
					}
					else if (e_ships[enemy_board[i][adj]].GetName() == "aircraft carrier") {
						cout << " A ";
					}
					else if (e_ships[enemy_board[i][adj]].GetName() == "submarine") {
						cout << " S ";
					}
					else {
						cout << " ? ";
					}
				}
			}
			else {
				if (ii < 10) {
					if (ally_board[i][ii] < 0) {
								cout << " - ";
							}
					else {
						if (a_ships[ally_board[i][ii]].GetName() == "cruiser") {
							cout << " C ";
						}
						else if (a_ships[ally_board[i][ii]].GetName() == "battleship") {
							cout << " B ";
						}
						else if (a_ships[ally_board[i][ii]].GetName() == "destroyer") {
							cout << " D ";
						}
						else if (a_ships[ally_board[i][ii]].GetName() == "aircraft carrier") {
							cout << " A ";
						}
						else if (a_ships[ally_board[i][ii]].GetName() == "submarine") {
							cout << " S ";
						}
						else {
							cout << " ? ";
						}
					}
				}
				else {
					cout << " ";
				}
			}
		}
		cout << endl << endl;
	}
	cout << endl;
}