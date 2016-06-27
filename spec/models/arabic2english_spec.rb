require 'rails_helper'

RSpec.describe Arabic2english, type: :model do
    
    it "is a valid number" do
        convert = Arabic2english.number_to_words(101)
        expect(convert).to include("one hundred one")
    end
    
    it "is a valid number but wrong output" do
        convert = Arabic2english.number_to_words(1011)
        expect(convert).not_to include("one thousand eleven one")
    end
    
    it "is invalid a input with incorrect error message" do
        convert = Arabic2english.number_to_words("abc")
        expect(convert).not_to include("one thousand eleven")
    end
    
    it "is invalid a input with correct message" do
        convert = Arabic2english.number_to_words("abc")
        expect(convert).to include("Wrong Input.")
    end
    
    it "is fload input with correct message" do
        convert = Arabic2english.number_to_words(11.1)
        expect(convert).to include("Wrong Input.")
    end
end
