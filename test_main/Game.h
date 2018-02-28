#ifndef Game_H_INCLUDED
#define Game_H_INCLUDED

#pragma once
#include "draw_board.h"
#include "Ship.h"
#include <vector>
#include <unordered_map>

typedef std::size_t Ship_ID;
typedef int Ship_UID;
enum SHIPS { DESTROYER, CRUISER, BATTLESHIP, SUBMARINE, AIRCRAFT_CARRIER };

// turnTrack object, helps track turn data
struct turnTrack {
	bool player;
	int turn;
	std::vector<std::vector<std::vector<shot>>> data;
	turnTrack() {
		player = 0;
		turn = 0;

		std::vector<shot> shotCountOne;
		std::vector<std::vector<shot>> shotTurnsOne;
		shotTurnsOne.push_back(shotCountOne);

		std::vector<shot> shotCountTwo;
		std::vector<std::vector<shot>> shotTurnsTwo;
		shotTurnsTwo.push_back(shotCountTwo);

		data.push_back(shotTurnsOne);
		data.push_back(shotTurnsTwo);
	}

	shot & operator[](int n) {
		return data[player][turn][n];
	}

	std::vector<shot> & current() {
		return data[player][turn];
	}

	void newTurn() {
		std::vector<shot> shotCountOne;
		std::vector<std::vector<shot>> shotTurnsOne;
		data[player].push_back(shotCountOne);

		std::vector<shot> shotCountTwo;
		std::vector<std::vector<shot>> shotTurnsTwo;
		data[!player].push_back(shotCountTwo);

		turn++;
	}

	void addShot(shot & s) {
		data[player][turn].push_back(s);
	}
};

// IDBase object, store and access Ship_ID's using a unique ID
struct IDBase {
	std::unordered_map<int, std::tuple<bool, Ship_ID>> data;
	int unique_index;

	auto operator[](int UID) {
		return data[UID];
	}

	Ship_ID index(int UID) {
		return std::get<1>(data[UID])-1;
	}

	int add(bool player, Ship_ID ID) {
		data.insert(std::make_pair(unique_index, std::make_pair(player, ID)));
		return unique_index++;
	}

	void destroy(int UID) {
		data[UID] = std::make_pair(false, 0);
	}
};

// Game class
class Game {
private:
	int pointTotal[2];
	int turn;
	bool selectedPlayer;
	bool gameOver;
	std::vector<std::vector<Ship>> boards;
	std::vector<Ship> shipTypes;
	turnTrack shotsFired;
	IDBase IDB;

	std::function<void()> onGameOver;
	std::function<void()> onSwitch;

public:
	// Ctrs
	Game();
	Game(std::vector<Ship> & Types, int Points);

	Ship_UID addShip(std::size_t ID, std::size_t x, std::size_t y); // Add a ship to the board, return its ID if successful, 0 otherwise
	Ship & getShip(int UID); // Returns the ship with the given ID
	void destroyShip(Ship_UID ID);
	void switchPlayer();
	void nextTurn();

	std::vector<shot> & shoot(Ship_UID s, std::size_t x, std::size_t y);
	bool moveShip(Ship_UID s, std::size_t x, std::size_t y);
	bool rotateShip(Ship_UID s);

	// Helper functions
	bool isLegalPlacement(int index);
	int shipsRemaining();
	std::vector<Ship> & getBoard();
	int currentPlayer();

	void printBoard();
	void printEnemy();

	std::string pointTotals();
	void registerGameOver(std::function<void()> endFn);
	void registerOnSwitch(std::function<void()> switchFn);
};

#endif
