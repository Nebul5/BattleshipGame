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
<<<<<<< HEAD

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

// Move
void Ship::Move(int x_comp, int y_comp) {
	x_loc += x_comp;
	y_loc += y_comp;
}

// Rotate
void Ship::Rotate() {
	horiz_vert = !horiz_vert;
}

// isVisible
bool Ship::isVisible() {
	return (tracked > 0 && !stealth);
}

bool Ship::isDestroyed() {
	if (hp < 0) return true;
	return false;
};
bool Ship::isTracked() {
	if (tracked == 1) return true;
	return false;
};
