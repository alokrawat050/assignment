class LeapYear < ActiveRecord::Base
    def self.leap_year?(year)
      (year % 4 == 0) && !(year % 100 == 0) || (year % 400 == 0)
    end
    #call by LeapYear.leap_year? 2004
end
