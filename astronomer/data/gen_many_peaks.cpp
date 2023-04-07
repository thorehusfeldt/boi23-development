#include <bits/stdc++.h>

long long rnd(long long from, long long to) {
	assert(from <= to);
	long long pad = std::max(0LL, -from);
	from += pad;
	to += pad;
	return ((long long) (rand() % 100000) * (rand() % 100000)) % (to - from + 1) + from - pad;
}

int n, k, s, t;
std::vector <std::pair <int, int>> a;

int main(int argc, char** argv) {
	int seed = 0;
	for (int i = 1; i < argc; i++) {
		std::string arg = argv[i];
		if (arg == "--s") {
			std::string val = argv[i + 1];
			s = std::stoi(val);
			i++;
		} else if (arg == "--t") {
			std::string val = argv[i + 1];
			t = std::stoi(val);
			i++;
		}else if (arg == "--n") {
			std::string val = argv[i + 1];
			n = std::stoi(val);
			i++;
		}else if (arg == "--k") {
			std::string val = argv[i + 1];
			k = std::stoi(val);
			i++;
		} else {
			seed = std::stoi(arg);
		}
	}
	srand(seed);
	for (int i = 0; i < n; i += 3) {
		double ran = rnd(0, 1e9) / 1e9;
		int cenx = std::cos(2 * M_PI * ran) * 1e9 - 100;
		int ceny = std::sin(2 * M_PI * ran) * 1e9 - 100;
		for (int j = 0; j < 3; j++) {
			a.emplace_back(cenx + rnd(-50, 50), ceny + rnd(-50, 50));
		}
	}
	std::cout << k << " " << n << " " << s << " " << t << std::endl;
	assert((int) a.size() == n);
	for (auto p : a) {
		std::cout << p.first << " " << p.second << "\n";
	}
}

// seeds:
//
// s=0 7702
// s=0 1949
// s=9 2168
// s=9 1265
