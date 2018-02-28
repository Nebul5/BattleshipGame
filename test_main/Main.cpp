// ************************* //
//         Main.cpp          //
//  for testing Ship class   //
//      by Jake Conner		 //
// ************************* //

#include <iostream>
#include <string>
#include "Ship.h"
#include "draw_board.h"
#include <vector>
#include <tuple>
#include "Game.h"

using std::cout;
using std::endl;

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

int main(){
	
	// *************** //
	// Test Game class //
	// *************** //

	Game myGame;
	Ship_UID cruiser = myGame.addShip(SHIPS::CRUISER, 4, 2);
	myGame.printBoard();
	std::cin.get();

	myGame.switchPlayer();
	Ship_UID battleship = myGame.addShip(SHIPS::BATTLESHIP, 4, 0);
	myGame.printBoard();
	cout << endl << myGame.pointTotals();
	std::cin.get();

	PlayerNum player;
	player.player = myGame.currentPlayer();
	//std::function<void()> Switch = std::bind(&PlayerNum::Switch, &player);
	myGame.registerOnSwitch([&player]() {
		player.Switch();
	});
	myGame.registerGameOver([&player]() {cout << "Game Over! " << "Player " << std::to_string(player) << " wins!" << endl; });

	myGame.switchPlayer();
	cout << "Player " << std::to_string(player) << endl;
	myGame.switchPlayer();
	cout << "Player " << std::to_string(player) << endl;

	// Test shoot and gameOver
	std::vector<shot> thisTurn = myGame.shoot(battleship, 3, 2);
	myGame.printEnemy();
	std::cin.get();

	std::vector<shot> thisTurn2 = myGame.shoot(battleship, 4, 2);
	myGame.printEnemy();
	std::cin.get();

	std::vector<shot> thisTurn3 = myGame.shoot(battleship, 5, 2);
	myGame.printEnemy();
	std::cin.get();

	cout << std::to_string(myGame.shipsRemaining()) << endl;
	myGame.switchPlayer();
	cout << std::to_string(myGame.shipsRemaining()) << " " << myGame.getShip(cruiser).Report() << endl;
	
	// Test cases for moveShip and rotateShip
	Ship_UID aship = myGame.addShip(SHIPS::CRUISER, 2, 0);
	Ship_UID bship = myGame.addShip(SHIPS::BATTLESHIP, 2, 1);
	Ship_UID cship = myGame.addShip(SHIPS::DESTROYER, 5, 0);
	Ship_UID dship = myGame.addShip(SHIPS::BATTLESHIP, 6, 1);
	myGame.moveShip(cship, 9, 1);
	Ship_UID eship = myGame.addShip(SHIPS::CRUISER, 6, 0);
	myGame.moveShip(cship, 5, 2);
	myGame.rotateShip(cship);
	myGame.rotateShip(dship);
	myGame.printBoard();
	std::cin.get();


	// ************************** //
	// Test the ship class itself //
	// ************************** //

	bool keep_shooting = true;

	// Make an attack and a new ship
	attack barrage(5, 2, 3);
	Ship boaty("boaty", 10, 4, 4, 4, 5, false, [&keep_shooting]() { keep_shooting = false; }, barrage);

	// Keep shooting until it dies
	while (keep_shooting) {
		cout << boaty.Report() << endl;
		boaty.Damage(barrage);
	}

	// We got out of the loop if we're here.
	cout << "done" << endl;
	std::cin.get();

	// *************** //
	// Test draw_board //
	// *************** //

	// test draw_board with empty board
	cout << "test draw_board with empty board" << endl;
	std::vector<Ship> board;
	draw_board(board);
	std::cin.get();

	// test draw_board with one cruiser in it
	cout << "test draw_board with one cruiser in it" << endl;
	Ship Cruiser("cruiser", 4, 0, 2, 5, 5, false, []() {cout << "Cruiser destroyed!" << endl; }, barrage);
	board.push_back(Cruiser);
	draw_board(board);
	std::cin.get();

	// test after moving the cruiser
	cout << "test after moving the cruiser" << endl;
	board[0].Move(2, 0);
	board[0].Move(0, 4);
	draw_board(board);
	std::cin.get();

	// test after rotating the cruiser
	cout << "test after rotating the cruiser" << endl;
	board[0].Rotate();
	draw_board(board);
	std::cin.get();

	// test after rotating the cruiser
	cout << "test after rotating the cruiser" << endl;
	board[0].Rotate();
	draw_board(board);
	std::cin.get();

	// Add a battleship
	cout << "Add a battleship" << endl;
	board.push_back(Ship("battleship", 10, 4, 4, 2, 15, false, []() {cout << "Battleship destroyed!" << endl; }, barrage));
	draw_board(board);
	std::cin.get();

	// Move the battleship
	cout << "Move the battleship" << endl;
	board[1].Move(0, 7);
	draw_board(board);
	std::cin.get();

	// Rotate the battleship
	cout << "Rotate the battleship" << endl;
	board[1].Rotate();
	draw_board(board);
	std::cin.get();

	// Move the cruiser again
	cout << "Move the cruiser again" << endl;
	board[0].Move(3, 0);
	draw_board(board);
	std::cin.get();

	// Make an aircraft carrier
	cout << "Make an aircraft carrier" << endl;
	Ship newShip("aircraft carrier", 10, 0, 5, 1, 20, false, []() {cout << "Carrier destroyed!" << endl; }, barrage);
	board.push_back(newShip);
	draw_board(board);
	std::cin.get();

	// Make sure the values of all our ships are all still the same
	cout << "Make sure the values of all our ships are all still the same" << endl;
	cout << board[2].Report() << endl;
	cout << board[0].Report() << endl;
	cout << board[1].Report() << endl;
	std::cin.get();

	// *************** //
	// Test draw_enemy //
	// *************** //

	// None of our boats are tracked and there have been no shots
	cout << "None of our boats are tracked and there have been no shots" << endl;
	std::vector<shot> s;
	draw_enemy(board, s);
	std::cin.get();

	// Take a shot that misses
	cout << "Take a shot that misses" << endl;
	shot newShot(7, 8, board, barrage);
	s.push_back(newShot);
	draw_enemy(board, s);
	std::cin.get();

	// Take a shot that hits
	cout << "Take a shot that hits" << endl;
	cout << board[1].Report() << endl;
	shot aHit(2, 7, board, barrage);
	s.push_back(aHit);
	draw_enemy(board, s);
	cout << board[1].Report() << endl;
	std::cin.get();

	// Since we gave barrage tracking the enemy can now see our battleship!

	// Lets try to hit the aircraft carrier
	cout << "Since we gave barrage tracking the enemy can now see our battleship! Lets try to hit the aircraft carrier." << endl;
	cout << board[2].Report() << endl;
	shot anotherHit(4, 0, board, barrage);
	s.push_back(anotherHit);
	draw_enemy(board, s);
	cout << board[2].Report() << endl;
	std::cin.get();

	// Now lets make a submarine
	cout << "Now lets make a submarine" << endl;
	Ship Sub("submarine", 6, 0, 3, 5, 10, true, []() {cout << "Submarine destroyed!" << endl; }, barrage);
	Sub.Move(7, 6);
	board.push_back(Sub);

	// Draw our new board
	cout << "Draw our new board to show that we've added it" << endl;
	draw_board(board);
	std::cin.get();

	// Now lets hit it with a barrage
	cout << "Now lets hit it with a barrage" << endl;
	cout << board[3].Report() << endl;
	shot aSubHit(7, 6, board, barrage);
	cout << board[3].Report() << endl;
	s.push_back(aSubHit);
	draw_enemy(board, s);
	std::cin.get();

	cout << "Our sub got hit, but because it is stealthy the tracking effect does nothing!" << endl;
	std::cin.get();

    return 0;
}