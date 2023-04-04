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
#define vvii vector<vii>
#define vvvi vector<vvi>
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
    }

    return res;
}

struct Event {
    int u, v, d;
    int tp; 
    Event(int _u, int _v, int _d, int _tp) : u(_u), v(_v), d(_d), tp(_tp) {}
    bool operator<(const Event other) const {
        return tp > other.tp;
    }
    // 1 add dependency
    // 2 set inactive
    // 3 set active
};


int main() {
    cin >> n >> m >> k >> Q;

    n = 1e9;
    m = 1e9;

    vll tt;
    vll a = query({{0,0},{0,m}});

    set<ii> init;
    FORE(p,a) FORE(q,a) {
        if((p+q-m)%2) continue;
        ll x = (p + q - m)/2;
        ll y = p - x;
        if(y < 0 || y > m || x < 0 || x > n) continue;
        init.insert({x,y});
    }

    vii pts(ALL(init));
    int cp = pts.size();

    priority_queue<pair<int,Event>> pq; // events

    vvvi dep(cp,vvi(4));
    vvii adep(cp);
    vvi dc(cp,vi(4));
    FOR(i,cp) FOR(j,cp) {
        if(i == j) continue;
        if(dist(pts[i],pts[j]) > cp*cp*4) continue; // Might want to check this limit out.
        int dx = abs(pts[j].F - pts[i].F), dy = abs(pts[j].S - pts[i].S);
        if(dx <= dy) {
            if(pts[j].S > pts[i].S) {
                pq.push({-(dy/2),Event(i,j,0,1)});
            } else if (pts[j].S < pts[i].S) {
                pq.push({-(dy/2),Event(i,j,1,1)});
            }
        }
        if(dx >= dy) {
            if(pts[j].F > pts[i].F) {
                pq.push({-(dx/2),Event(i,j,2,1)});
            } else if (pts[j].F < pts[i].F) {
                pq.push({-(dx/2),Event(i,j,3,1)});
            }
        }
    }

    FOR(i,cp) {
        vll r = {m-pts[i].S, pts[i].S, n-pts[i].F, pts[i].F};
        FOR(j,4) pq.push({-r[j],Event(i,-10,j,2)});
    }
    set<ii> ac;
    FOR(i,cp) FOR(j,4) ac.insert({i,j});
    vvi iac(cp, vi(4));
    vi vis(cp);

    vii qps(cp);
    unordered_set<int> dd;

    vii dir = {{0,1},{0,-1},{1,0},{-1,0}};
    vi odr;
    int cc = -1;
    int ss = 0;
    //int cnter = 0;
    while(ss < cp) {
        cc++;
        while(!pq.empty() && -pq.top().F <= cc) {
            Event e = pq.top().S;
            pq.pop();
            if(e.tp == 1) {
                if(!vis[e.v]) {
                    adep[e.v].pb({e.u,e.d});
                    iac[e.u][e.d]++;
                    ac.erase({e.u,e.d});
                }
            } else if (e.tp == 2) {
                iac[e.u][e.d]++;
                ac.erase({e.u,e.d});
            } else if (e.tp == 3) {
                --iac[e.u][e.d];
                if(!iac[e.u][e.d] && !vis[e.u]) ac.insert({e.u,e.d});
            } else {
                assert(false);
            }
        }
        while(ac.size() && vis[ac.begin()->F]) ac.erase(ac.begin());
        if(ac.empty()) {
            if(pq.empty()) break;
            cc = -pq.top().F - 1; // Next time something happens
            continue;
        }
        if(dd.count(cc)) continue;
        int u,d;
        tie(u,d) = *ac.begin();
        ac.erase(ac.begin());
        vis[u] = true;
        qps[u] = {pts[u].F + dir[d].F*cc, pts[u].S + dir[d].S*cc};
        odr.pb(u);
        FORE(vp,adep[u]) {
            --iac[vp.F][vp.S];
            if(!iac[vp.F][vp.S]) ac.insert({vp.F,vp.S});
        }
        ss++;
        FOR(i,cp) {
            dd.insert(dist(qps[u],pts[i]));
            if(i == u || vis[i]) continue;
            if(abs(pts[u].F-pts[i].F) <= cc+1) 
            {
                if(pts[u].S-pts[i].S > 0) {
                    pq.push({-(pts[u].S-pts[i].S-cc),Event(i,-1,0,2)});
                    pq.push({-(pts[u].S-pts[i].S+cc),Event(i,-1,0,3)});
                } else {
                    pq.push({-(pts[i].S-pts[u].S-cc),Event(i,-1,1,2)});
                    pq.push({-(pts[i].S-pts[u].S+cc),Event(i,-1,1,3)});
                }
            }
            if(abs(pts[u].S-pts[i].S) <= cc+1) {
                if(pts[u].F-pts[i].F > 0) {
                    pq.push({-(pts[u].F-pts[i].F-cc),Event(i,-1,2,2)});
                    pq.push({-(pts[u].F-pts[i].F+cc),Event(i,-1,2,3)});
                } else {
                    pq.push({-(pts[i].F-pts[u].F-cc),Event(i,-1,3,2)});
                    pq.push({-(pts[i].F-pts[u].F+cc),Event(i,-1,3,3)});
                }
            }
        }
    }

    vll ds = query(qps);

    map<ll,int> cnt;
    FORE(d,ds) cnt[d]++;
    vii sol;

    FOR(pmi,cp) {
        int pi = odr[pmi];
        ii p = pts[pi];
        if(cnt[dist(qps[pi],pts[pi])]) {
            sol.pb(p);
            FORE(q,qps) {
                cnt[dist(p,q)]--;
            }
        }
    }
    cout << "! ";
    FORE(s,sol) cout << s.F << " " << s.S << " ";
    cout << endl;
}