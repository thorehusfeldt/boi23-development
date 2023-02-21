#include <cstdlib>
#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define com complex<double>
#define ld long double;
#define ii pair<ll,ll>
#define vi vector<int>
#define vii vector<ii>
#define FOR(x,n) for(int x=0;x<(n);x++)
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

int dist(ii x, ii y) {
    return abs(x.F - y.F) + abs(x.S - y.S);
}

vi query(ii q) {
    cout << "? 1" << endl;
    cout << q.F << " " << q.S << endl;

    vi res(k);
    FOR(i,k) cin >> res[i];
    Q--;
    return res;
}

int main() {
    cin >> n >> m >> k >> Q;

    // Attempting to get somewhat random behaviour wihtout the issues with reproducibility at first.
    srand(42); 

    vi a = query({0,0});
    vi b = query({0,m});
    set<ii> init;
    FORE(p,a) FORE(q,b) {
        if((p+q-m)%2) continue;
        ll x = (p + q - m)/2;
        ll y = p - x;
        if(y < 0 || y > m || x < 0 || x > n) continue;
        init.insert({x,y});
    }
    vii pts(ALL(init));

    vii sol;
    while(pts.size() > 0) {
        int ri = rand() % pts.size();

        vi qr = query(pts[ri]);
        set<int> st(ALL(qr));
        
        vii nc;
        FORE(p,pts) {
            if(st.count(dist(p,pts[ri]))) {
                if(p == pts[ri]) {
                    sol.pb(p);
                } else {
                    nc.pb(p);
                }
            }
        }
        pts = nc;
    }
    cout << "! ";
    FORE(s,sol) cout << s.F << " " << s.S << " ";
    cout << endl;
}