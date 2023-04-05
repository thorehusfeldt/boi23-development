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
            // if(!(u%2 == 0 && v%2 == 0)) continue;
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
    int L = 0, R = ssize(pool);
    const int BLOCK = 32;
    while(ssize(ans) < k){
        int l = L;
        int r = L+BLOCK;
        if(r > R) r = R;
        else {
            if(!count_in_range(l, r)){
                L = r;
                continue;
            }
        }
        assert(L < R);
        while(l+1 < r){
            const int m = l + (r-l)/2;
            if(count_in_range(l, m)) r = m;
            else l=m;
        }
        ans.push_back(l);
        L = r;
    }

    cout << "!";
    for(auto &i : ans){
        auto const e = pool[i];
        cout << " " << e.x << " " << e.y;
    }
    cout << endl;
}

