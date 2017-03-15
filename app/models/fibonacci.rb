class Fibonacci < ActiveRecord::Base
    def self.fibonacci(n)
        a = 0
        b = 1
        # Compute Fibonacci number in the desired position.
        n.times do
            temp = a
            a = b
            # Add up previous two numbers in sequence.
            b = temp + b
            puts b
        end
        return a
    end
    
    #call by Fibonacci.fibonacci 5
    
    def self.fibonacci_1( n )
        return  n  if n <= 1 
         fibonacci_1( n - 1 ) + fibonacci_1( n - 2 )
         #p (1..n).map{|x| fibonacci_1(x)}
    end 
    #puts fibonacci_1( 10 )
    # => 55
    
    
    def self.fibonacci_2(n)
       n <= 1 ? n :  fibonacci_2( n - 1 ) + fibonacci_2( n - 2 ) 
    end
    #puts fibonacci_2( 10 )
end
