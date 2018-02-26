#ifndef draw_board_H_INCLUDED
#define draw_board_H_INCLUDED

#pragma once

#include <vector>
#include <iostream>
#include "Ship.h"

// shot struct
struct shot {
	int x_loc;
	int y_loc;
	bool hit_or_miss;

	shot() = delete;

	shot(int x, int y, std::vector<Ship> & ships, attack & a) {
		x_loc = x;
		y_loc = y;
		hit_or_miss = false;
		for (int i = 0; i < ships.size(); i++) {
			int bow_stern = ships[i].Length() / 2;
			if (ships[i].Orientation() == "horizontal" && ships[i].GetY()==y_loc) {
				if (x >= ships[i].GetX() - bow_stern && x <= bow_stern + ships[i].GetX()) {
					hit_or_miss = true;
					ships[i].Damage(a);
				}
			}
			if (ships[i].Orientation() == "vertical" && ships[i].GetX() == x_loc) {
				if (y >= ships[i].GetY() - bow_stern && y <= bow_stern + ships[i].GetY()) {
					hit_or_miss = true;
					ships[i].Damage(a);
				}
			}
		}
	}
};

// draw_board function
void draw_board(std::vector<Ship> & ships);
void draw_enemy(std::vector<Ship> & ships, std::vector<shot> & shots);

#endif