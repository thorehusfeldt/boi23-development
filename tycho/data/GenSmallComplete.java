
public class GenSmallComplete {

	/*
	 * Generates one of 32 tests for n=5 where a wait/go decision is made at
	 * each shelter.
	 * Takes as argument an string of length 5 where the k'th character
	 * corresponds to the optimal choice at the k'th shelter,
	 * with non-zero being to wait for next pulse and '0' to continue.
	 * 11000 produces the case where the rover waits at the first two shelters.
	 * 
	 * Will ignore any further arguments
	*/
	public static void main(String[] args) {
		if(args.length == 0) {
			System.err.println("Error: Supply at least one argument.");
			System.exit(1);
		}
		char[] answer = args[0].toCharArray();
		if(answer.length != 5) {
			System.err.println("Error: Invalid first argument, must contain 5 characters.");
			System.exit(2);
		}
		
		int n = 5;
		int p = 100;   // Period is long enough that we don't get hit by a pulse unless shelter is deliberately placed right before time of next pulse
		int d = 10000; // Damage is large enough that we don't consider waiting unless pulse is imminent
		
		int[] shelters = new int[5];
		int lastShelter = 0;     // Location of last shelter
		int lastShelterTime = 0; // Time of leaving last shelter
		
		for(int i = 0; i<5; i++) {
			if(answer[i] == '0') {
				// No risk of being hit by the pulsar, keep going
				shelters[i] = lastShelter + 10;
				lastShelterTime += 10;
			} else {
				// Place shelter right before next pulse
				int nextPulseTime = p * (1 + (lastShelterTime / p));
				int dist = nextPulseTime - lastShelterTime;
				shelters[i] = lastShelter + dist - 2;
				lastShelterTime = nextPulseTime;
			}
			lastShelter = shelters[i];
		}
		
		int b = shelters[4] + 10;

		System.out.println(b + " " + p + " " + d + " " + n);
		for(int s : shelters)
			System.out.println(s);
	}

}
