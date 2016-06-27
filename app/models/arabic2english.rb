class Arabic2english
    def self.number_to_words(value)
      numbers_to_name = {
          1000000 => "million",
          1000 => "thousand",
          100 => "hundred",
          90 => "ninety",
          80 => "eighty",
          70 => "seventy",
          60 => "sixty",
          50 => "fifty",
          40 => "forty",
          30 => "thirty",
          20 => "twenty",
          19=>"nineteen",
          18=>"eighteen",
          17=>"seventeen", 
          16=>"sixteen",
          15=>"fifteen",
          14=>"fourteen",
          13=>"thirteen",              
          12=>"twelve",
          11 => "eleven",
          10 => "ten",
          9 => "nine",
          8 => "eight",
          7 => "seven",
          6 => "six",
          5 => "five",
          4 => "four",
          3 => "three",
          2 => "two",
          1 => "one"
        }
    
        str = ""
        if value.is_a?(Integer)
            numbers_to_name.each do |num, name|
                if value == 0
                    return str
                elsif value.to_s.length == 1 && value/num > 0
                    return str + "#{name}"      
                elsif value < 100 && value/num > 0
                    return str + "#{name}" if value%num == 0
                    return str + "#{name} " + number_to_words(value%num)
                elsif value/num > 0
                    return str + number_to_words(value/num) + " #{name} " + number_to_words(value%num)
                end
            end
        else
            return "Wrong Input."
        end
    end
end