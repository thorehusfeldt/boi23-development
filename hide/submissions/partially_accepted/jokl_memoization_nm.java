import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;

public class jokl_memoization_nm{
	static int[] caves;
	static int z, m, c, n;

	// Let memo[i][k] be the minimum cost of reaching z
	// starting in caves[i] at a time t = k mod m
	static int[][] memo;
	public static void main(String[] args) throws Exception {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String[] line = br.readLine().split(" ");
		z = Integer.parseInt(line[0]);
		m = Integer.parseInt(line[1]);
		c = Integer.parseInt(line[2]);
		n = Integer.parseInt(line[3]) + 1;

		memo = new int[n][m];
		caves = new int[n];
		// Implicitly let pos. 0 be a cave
		for(int i = 1; i<n; i++) {
			caves[i] = Integer.parseInt(br.readLine());
		}
		
		System.out.println(explore(0, 0));
	}
	
	// Return damage suffered when traveling from caves[cave]
	// either taking off at time `time` (go-solution)
	// or waiting for next pulse (wait-solution)
	static int explore(int time, int cave) {
		if(memo[cave][time % m] != 0)
			return memo[cave][time % m];

		if(cave == (n-1)) {
			int go = damage(time, z-caves[cave]);
			int pulseTime = m * (time/m) + m;
			int wait = damage(pulseTime, z-caves[cave]) + (pulseTime-time);
			int sol = Math.min(go, wait);
			memo[cave][time % m] = sol;
			return sol;
		}
		int dist = caves[cave+1] - caves[cave];
		int go = damage(time, dist) + explore(time+dist, cave+1);
		int pulseTime = m * (time/m) + m;
		int wait = damage(pulseTime, dist) + (pulseTime-time) + explore(pulseTime+dist, cave+1);
		int sol = Math.min(go, wait);
		memo[cave][time % m] = sol;
		return sol;
	}
	
	// Damage received when traveling `dist` distance starting at time `time`,
	// assuming that final location is a cave
	static int damage(int time, int dist) {
		int pulses = (time+dist-1)/m - time/m;
		return c*pulses + dist;
	}
}
