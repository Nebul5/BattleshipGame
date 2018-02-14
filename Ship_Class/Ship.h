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
        int hp, armor, length, speed, tracked, place;
		bool stealth;

		std::function<void()> destroyed;
    public:
		Ship() = delete;
		// Ship class ctrs
		Ship(int h, int a, int l, int s, bool st) :
			hp(h), armor(a), length(l),speed(s),stealth(st){
			tracked = 0;
		};










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

		std::string report();
};