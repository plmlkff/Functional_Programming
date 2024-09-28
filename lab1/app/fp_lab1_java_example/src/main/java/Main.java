import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Main {
    private static List<Integer> generateFibs(int maxFib){
        int prev = 1, current = 2;
        List<Integer> fibs = new ArrayList<>(List.of(prev, current));
        while (current <= maxFib){
            int sum = prev + current;
            fibs.add(sum);
            prev = current;
            current = sum;
        }
        return fibs;
    }

    private static int countPowers(int limitA, int limitB){
        Set<BigInteger> powers = new HashSet<>();
        for (int i = 2; i <= limitA; i++) {
            for (int j = 2; j <= limitB; j++) {
                powers.add(BigInteger.valueOf(i).pow(j));
            }
        }
        return powers.size();
    }

    public static void main(String[] args) {
        final int maxFib = 1_000_000, limitA = 100, limitB = 100;

        int evenFibsCount = (int)generateFibs(maxFib).stream().filter(x->x%2==0).count();
        System.out.printf("Problem 2: %s\n", evenFibsCount);
        System.out.printf("Problem 29: %s\n", countPowers(limitA, limitB));
    }
}
