#include "Ship.h"

int Ship::damage(attack a) {
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

std::string Ship::report() {
	return "hp: " +std::to_string(hp)+" tracked for " +std::to_string(tracked) +" turns.";
}