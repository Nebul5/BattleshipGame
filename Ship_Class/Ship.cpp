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


bool Ship::placement() {
	return true;
};
bool Ship::move() {
	return true;
};

bool Ship::isDestroyed() {
	if (hp < 0) return true;
	return false;
};
bool Ship::isTracked() {
	if (tracked == 1) return true;
	return false;
};