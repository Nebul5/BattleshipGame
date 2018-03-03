#include "Ship.h"

int Ship::Damage(attack a) {
	// check for the track effect
	if (a.track > tracked) {
		if (!stealth) {
			tracked = a.track;
		}
	}

	// calculate armor after pierce
	int pierce = armor - a.pierce;
	if (pierce < 0) {
		pierce = 0;
	}

	// do damage
	a.damage -= pierce;
	if (a.damage >= 0) {
		hp -= a.damage;
	}
	else {
		a.damage = 0;
	}

	// death function
	if (hp <= 0) {
		destroyed();
	}

	// return value for UI to use
	return a.damage;
}

// Report status of ship in string form.
std::string Ship::Report() {
	return name + ": (" +std::to_string(x_loc) +", " +std::to_string(y_loc) +") hp: " +std::to_string(hp)+" tracked for " +std::to_string(tracked) +" turns.";
}

// Orientation, of Ship class returns a string describing the Ship's orientation.
std::string Ship::Orientation() {
	if (horiz_vert) {
		return "horizontal";
	}
	else {
		return "vertical";
	}
}

// assignment operator
Ship & Ship::operator=(const Ship & r) {
	return *this = Ship(r);
}

// GetName
std::string Ship::GetName() {
	return name;
}

// GetX
int Ship::GetX() {
	return x_loc;
}

// GetY
int Ship::GetY() {
	return y_loc;
}

// GetCost
int Ship::GetCost() {
	return cost;
}

// Move
void Ship::Move(int x, int y) {
	x_loc = x;
	y_loc = y;
}

// Rotate
void Ship::Rotate() {
	horiz_vert = !horiz_vert;
}

// setDestroy
void Ship::setDestroy(std::function<void()> fn) {
	destroyed = fn;
}

// isVisible
bool Ship::isVisible() {
	return (tracked > 0);
}

// getAttack
attack & Ship::getAttack() {
	return Attack;
}

// takeAction
void Ship::takeAction() {
	acted = !acted;
}

// reset
void Ship::reset() {
	acted = false;
}

// canAttack
bool Ship::canAttack() {
	return !acted;
}

// canTravel
bool Ship::canTravel(int x, int y) {
	if (!acted) {
		int x_dist = x - x_loc;
		int y_dist = y - y_loc;
		return (speed*speed >= (x_dist*x_dist + y_dist*y_dist));
	}
	else {
		return false;
	}
}