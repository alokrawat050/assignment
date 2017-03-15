class PrimeNumber < ActiveRecord::Base
    def self.get_prime_number_upto(number)
      start = 2
      primes = (start..number).to_a
      (start..number).each do |no|
        (start..no).each do |num|
          if ( no % num  == 0) && num != no
            primes.delete(no)
            break
          end
        end
      end
      primes
    end
    #call by PrimeNumber.get_prime_number_upto 5
    
    def self.is_prime_number(n)
      puts "That's not an integer." unless n.is_a? Integer
      is_prime = true
      for i in 2..n-1
        if n % i == 0
          is_prime = false
        end
      end
      if is_prime
        puts "#{n} is prime!"
      else
        puts "#{n} is not prime."
      end
    end
end
#call by PrimeNumber.is_prime_number 5