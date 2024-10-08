import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Main {
    private static int countEvenFibs(int maxFib) {
        int prev = 1, current = 2, newFib;
        List<Integer> evenFibs = new ArrayList<>(List.of(current));
        while ( (newFib = prev + current) <= maxFib) {
            if (newFib % 2 == 0) evenFibs.add(newFib);
            prev = current;
            current = newFib;
        }
        return evenFibs.size();
    }

    private static int countPowers(int limitA, int limitB) {
        Set<BigInteger> powers = new HashSet<>();
        for (int i = 2; i <= limitA; i++) {
            for (int j = 2; j <= limitB; j++) {
                powers.add(BigInteger.valueOf(i).pow(j));
            }
        }
        return powers.size();
    }

    public static void main(String[] args) {
        final int maxFib = 4_000_000, limitA = 100, limitB = 100;

        System.out.printf("Problem 2: %s\n", countEvenFibs(maxFib));
        System.out.printf("Problem 29: %s\n", countPowers(limitA, limitB));
    }
}
