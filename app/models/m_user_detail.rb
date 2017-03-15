class MUserDetail < ActiveRecord::Base
    secret_key = 'My-aSSIGnMENT-SLIaR-YbRU2017-2018-chECK-daTA'
    
    def initialize(id:, last_name:, first_name:, last_name_kana:, first_name_kana:, birth_date:, mobile_no:, tel_no:)
        @id = id
        @last_name = last_name
        @first_name = first_name
        @last_name_kana = last_name_kana
        @first_name_kana = first_name_kana
        @birth_date = birth_date
        @mobile_no = mobile_no
        @tel_no = tel_no
    end
      def greet
        if @id == 1
          "ぼくは#{@last_name}だよ。"
        else
          "僕は#{@last_name}です。"
        end
      end
end
