class Factorial < ActiveRecord::Base
    def self.factorial(n)
      n == 0? 1 : (1..n).inject(1) { |total, i| total*= i; total }
    end
    #call by Factorial.factorial 5
end