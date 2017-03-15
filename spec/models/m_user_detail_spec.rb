require 'rails_helper'

RSpec.describe MUserDetail, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it '1の場合、ひらがなで答えること' do
      m_user_detail = MUserDetail.new(id: 1, last_name: 'たろう', first_name: "yamada", last_name_kana: "",first_name_kana: "",birth_date: "",mobile_no: "",tel_no: "")
      expect(m_user_detail.greet).to eq 'ぼくはたろうだよ。'
    end
    it '1以外の場合、漢字で答えること' do
      m_user_detail = MUserDetail.new(id: 4, last_name: 'たろう', first_name: "yamada", last_name_kana: "",first_name_kana: "",birth_date: "",mobile_no: "",tel_no: "")
      expect(m_user_detail.greet).to eq '僕はたろうです。'
    end
end
