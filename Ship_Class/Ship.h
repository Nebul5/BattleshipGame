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
<<<<<<< HEAD
		std::string name;
        int hp, armor, length, speed, tracked;
		int x_loc, y_loc;
		bool stealth;
		attack Attack;
		std::function<void()> destroyed;
		bool horiz_vert; // true means horizontal
=======
        int hp, armor, length, speed, tracked, place;
		bool stealth;
>>>>>>> f223b37fdbdd5fa76ad6698a07257505d8d4ebea

		std::function<void()> destroyed;
    public:
		Ship() = delete;
		// Ship class ctrs
<<<<<<< HEAD
		Ship(std::string Name, int Hitpoints, int Armor, int Length, int Speed, bool Stealthy, std::function<void()> onDestroy, const attack & Attack) : 
			name(Name), hp(Hitpoints), armor(Armor), length(Length), stealth(Stealthy), destroyed(onDestroy), Attack(Attack) {
=======
		Ship(int h, int a, int l, int s, bool st) :
			hp(h), armor(a), length(l),speed(s),stealth(st){
>>>>>>> f223b37fdbdd5fa76ad6698a07257505d8d4ebea
			tracked = 0;
			horiz_vert = true;
			x_loc = 0 + length / 2;
			y_loc = 0;
		};

<<<<<<< HEAD
		Ship(const Ship & s) :
			name(s.name), hp(s.hp), armor(s.armor), length(s.length), speed(s.speed), tracked(s.tracked), 
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

		// Move
		void Move(int x_comp, int y_comp);

		// Rotate
		void Rotate();

		// isVisible
		bool isVisible();
};
=======









		void setHP(const int &h) {
			hp = h;
		};
		void setArmor(const int &h) {
			hp = h;
		};
		void setLength(const int &h) {
			hp = h;
		};
		void setSpeed(const int &h) {
			hp = h;
		};
		void setTracked(const int &h) {
			hp = h;
		};
		int getHP(){
			return hp;
		};
		int getArmor() {
			return armor;
		};
		int getLength() {
			return length;
		};
		int getSpeed() {
			return speed;
		};
		int getStealth() {
			return stealth;
		};

		bool placement();
		bool move();

		bool isDestroyed();
		bool isTracked();
		int damage(attack a);
		// damage member function, for doing damage to the ship
>>>>>>> f223b37fdbdd5fa76ad6698a07257505d8d4ebea

#endif