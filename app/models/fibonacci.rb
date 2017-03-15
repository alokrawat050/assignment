class Fibonacci < ActiveRecord::Base
    def self.fibonacci_1( n )
        return  n  if n <= 1 
         fibonacci_1( n - 1 ) + fibonacci_1( n - 2 )
    end 
    #puts fibonacci_1( 10 )
    # => 55
    
    
    def self.fibonacci_2(n)
       n <= 1 ? n :  fibonacci_2( n - 1 ) + fibonacci_2( n - 2 ) 
    end
    #puts fibonacci_2( 10 )
end
