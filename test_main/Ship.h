#ifndef Ship_H_INCLUDED
#define Ship_H_INCLUDED

#include <tuple>
#include <functional>
#include <string>

// attack struct
struct attack {
	int damage;
	int pierce;
	int track;

	attack() = delete;
	attack(const attack & a) : damage(a.damage), pierce(a.pierce), track(a.track) {}
	attack(int d, int p, int t) : damage(d), pierce(p), track(t) {}

	attack & operator=(attack & a) {
		damage = a.damage;
		pierce = a.pierce;
		track = a.track;
	}
};

// Ship class
class Ship{
    private:
		std::string name;
        int hp, armor, length, speed, tracked, cost;
		int x_loc, y_loc;
		bool stealth;
		attack Attack;
		std::function<void()> destroyed;
		bool horiz_vert; // true means horizontal

    public:
		Ship() = delete;

		// Ship class ctrs
		Ship(std::string Name, int Hitpoints, int Armor, int Length, int Speed, int Cost, bool Stealthy, std::function<void()> onDestroy, const attack & Attack) : 
			name(Name), hp(Hitpoints), armor(Armor), length(Length), speed(Speed), cost(Cost), stealth(Stealthy), destroyed(onDestroy), Attack(Attack) {
			tracked = 0;
			horiz_vert = true;
			x_loc = 0 + length / 2;
			y_loc = 0;
		}; // name, hitpoints, armor, length, speed, cost, stealth, onDestroy, attack

		Ship(const Ship & s) :
			name(s.name), hp(s.hp), armor(s.armor), length(s.length), cost(s.cost), speed(s.speed), tracked(s.tracked), 
			x_loc(s.x_loc), y_loc(s.y_loc), stealth(s.stealth), Attack(s.Attack), destroyed(s.destroyed),
			horiz_vert(s.horiz_vert) {
		};

		// Damage member function, for doing damage to the ship
		int Damage(attack a);

		// Length member function
		int Length() { return length; };

		// Report member function
		std::string Report();

		// Orientation member function
		std::string Orientation();

		// GetName
		std::string GetName();

		// GetX and GetY
		int GetX();
		int GetY();

		// GetCost
		int GetCost();

		// Move
		void Move(int x_comp, int y_comp);

		// Rotate
		void Rotate();

		// isVisible
		bool isVisible();
};

#endif