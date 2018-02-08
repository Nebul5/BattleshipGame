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
        int hp, armor, length, speed, tracked;
		bool stealth;
		attack Attack;
		std::function<void()> destroyed;

    public:
		Ship() = delete;

		// Ship class ctrs
		Ship(int h, int a, int l, int s, bool st, std::function<void()> onDestroy, const attack & at) : 
			hp(h), armor(a), length(l), stealth(st), destroyed(onDestroy), Attack(at) {
			tracked = 0;
		};

		Ship(const Ship & s) :
			hp(s.hp), armor(s.armor), length(s.length), stealth(s.stealth), destroyed(s.destroyed), Attack(s.Attack) {
			tracked = 0;
		};

		// damage member function, for doing damage to the ship
		int damage(attack a);

		std::string report();
};