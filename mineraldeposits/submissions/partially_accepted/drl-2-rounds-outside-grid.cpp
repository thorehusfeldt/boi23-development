#include <cstdlib>
#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define com complex<double>
#define ld long double;
#define ii pair<ll,ll>
#define vi vector<int>
#define vll vector<ll>
#define vvi vector<vi>
#define vvll vector<vll>
#define vii vector<ii>
#define FOR(x,n) for(int x=0;x<(int)(n);x++)
#define FORS(x,n) for(int x=1;x<=(n);x++)
#define FORE(x,a) for(auto &x: a)
#define FORT(x,a,b) for(int x=(a);x<(b);x++)
#define FORD(x,a,b) for(int x=(a);x>=(b);x--)
#define ALL(x) x.begin(),x.end()
#define REP(n) for(int _ = 0; _ < n; _++)
#define MT make_tuple
#define MP make_pair
#define pb push_back
#define F first
#define S second
#define vvvll vector<vvll>
#define sz(x) ((int)x.size())
int n,m,k,Q;

ll dist(ii x, ii y) {
    return abs(x.F - y.F) + abs(x.S - y.S);
}

vll query(vii qs) {
    cout << "? " << qs.size() << endl;
    vll res(k*qs.size());
    FORE(q,qs) {
        cout << q.F << " " << q.S << endl;
    }
    FOR(i,(k*qs.size())) {
        cin >> res[i];
        //cout << " got " << res[i] << endl;
    }

    return res;
}

ll r = 3e5; 

int main() {
    cin >> n >> m >> k >> Q;

    srand(42); 

    vll tt = query({{0,0},{0,4*r}});
    vll a,b;
    FORE(d,tt) {
        if(d > 3*r) b.pb(d-3*r);
        else a.pb(d);
    }
    //cout << a.size() << " " << b.size() << endl;
    set<ii> init;
    FORE(p,a) FORE(q,b) {
        //cerr << " " << p << " " << q << endl;
        if((p+q-r)%2) continue;
        ll x = (p + q - r)/2;
        ll y = p - x;
        if(y < 0 || y > m || x < 0 || x > n) continue;
        init.insert({x,y});
    }
    vii pts(ALL(init));
    reverse(ALL(pts));
    vii qs;

    FOR(i,pts.size()) {
        qs.pb({n + i*r,pts[i].S});
    }

    vll ds = query(qs);

    vector<map<ll,int>> mp(pts.size());

    FORE(d,ds) {
        ll pt = d/r;
        //cout << " " << pt << " " << d << endl;
        mp[pt][d-pt*r]++;
    }

    vii sol;
    // Use that pts is already lex-sorted
    FOR(pi,pts.size()) {
        ii p = pts[pi];
        FORE(q,sol) {
            mp[pi][dist({n,p.S},q)]--;
        }
        if(mp[pi][n-p.F] == 1) {
            sol.pb(p);
        } 
    }
    cout << "! ";
    FORE(s,sol) cout << s.F << " " << s.S << " ";
    cout << endl;
}