/*
 *   An optimized solution based on finding k^2 candidates + recursive integer tree search
 *   By doing integer queries "number of zeros" instead of just "no zero / at least one zero",
 *   we can cut the number of queries almost in half.
 *
 */


#include <bits/stdc++.h>
using namespace std;

using ll = int64_t;

template<typename T>
int64_t ssize(T const&v){ return (int64_t) v.size(); }

struct Point{
    ll x, y;
    friend bool operator<(Point const&a, Point const&b){
        return make_pair(a.x, a.y) < make_pair(b.x, b.y);
    }
    friend bool operator==(Point const&a, Point const&b){
        return !((a < b) || (b < a));
    }
};

ll X, Y;
int k, Q;
vector<ll> query(vector<Point> const&v){
    for(auto const&p : v){
        assert(0 <= p.x && p.x <= X);
        assert(0 <= p.y && p.y <= Y);
    }
    cout << "? " << v.size() << "\n";
    for(auto const&p : v){
        cout << p.x << " " << p.y << "\n";
    }
    cout << flush;
    vector<ll> ret(ssize(v) * k);
    for(auto &e : ret){
        cin >> e;
    }
    return ret;
}
int query_zeros(vector<Point> const&v){
    auto tmp = query(v);
    return count(tmp.begin(), tmp.end(), 0);
}

signed main(){
    cin >> X >> Y >> k >> Q;
    auto A = query({Point{0, 0}});
    auto B = query({Point{X, 0}});
    vector<Point> pool;
    for(int a : A){
        for(int b : B){
            ll u  = (a-b+X), v = (a+b-X);
            if(!(u%2 == 0 && v%2 == 0)) continue;
            u/=2, v/=2;
            if(u < 0 || u > X) continue;
            if(v < 0 || v > Y) continue;
            pool.push_back(Point{u, v});
        }
    }
    sort(pool.begin(), pool.end());
    pool.erase(unique(pool.begin(), pool.end()), pool.end());

    auto count_in_range = [&](int l, int r){
        return query_zeros(vector<Point>(pool.begin()+l, pool.begin()+r));
    };
    vector<int> ans;
    auto rec = [&](auto& rec, int l, int r, int &expected){
        if(expected == -1) expected = count_in_range(l, r);
        if(!expected) return;
        if(r-l == 1){
            ans.push_back(l);
            return;
        }
        const int m = l + (r-l)/2;
        int cnt_left = -1;
        rec(rec, l, m, cnt_left);
        int cnt_right = expected - cnt_left;
        rec(rec, m, r, cnt_right);
    };
    rec(rec, 0, ssize(pool), k);

    cout << "!";
    for(auto &i : ans){
        auto const e = pool[i];
        cout << " " << e.x << " " << e.y;
    }
    cout << endl;
}

