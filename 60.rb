# The primes 3, 7, 109, and 673, are quite remarkable. By taking any two primes and
# concatenating them in any order the result will always be prime. For example, 
# taking 7 and 109, both 7109 and 1097 are prime. The sum of these four primes, 792,
# represents the lowest sum for a set of four primes with this property.
#
# Find the lowest sum for a set of five primes for which any two primes concatenate 
# to produce another prime.

require 'prime'

def concat_prime?(n1, n2)
  Prime.prime?((n1.to_s + n2.to_s).to_i) && Prime.prime?((n2.to_s + n1.to_s).to_i)
end

# lets see if we can get away with an upper limit of 10,000
# there are 1,229 primes below 10,000
primes = Prime.take_while{|p| p < 10_000}

for i in (0...1_229)
  for j in (i+1...1_229)
    next unless concat_prime?(primes[i], primes[j])
    for k in (j+1...1_229)
      next unless concat_prime?(primes[i], primes[k]) && concat_prime?(primes[j], primes[k])
      for l in (k+1...1_229)
        next unless concat_prime?(primes[i], primes[l]) && concat_prime?(primes[j], primes[l]) && concat_prime?(primes[k], primes[l])
        for m in (l+1...1_229)
          if concat_prime?(primes[i], primes[m]) &&
             concat_prime?(primes[j], primes[m]) && 
             concat_prime?(primes[k], primes[m]) &&
             concat_prime?(primes[l], primes[m])
            p [primes[i], primes[j], primes[k], primes[l], primes[m]]
            p primes[i] + primes[j] + primes[k] + primes[l] + primes[m]
            exit
          end
        end
      end
    end
  end
end

