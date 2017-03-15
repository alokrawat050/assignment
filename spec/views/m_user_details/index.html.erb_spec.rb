require 'rails_helper'

RSpec.describe "m_user_details/index", type: :view do
  before(:each) do
    assign(:m_user_details, [
      MUserDetail.create!(
        :last_name => "Last Name",
        :first_name => "First Name",
        :last_name_kana => "Last Name Kana",
        :first_name_kana => "First Name Kana",
        :encrypted_birth_date => "Encrypted Birth Date",
        :encrypted_mobile_no => "Encrypted Mobile No",
        :encrypted_tel_no => "Encrypted Tel No"
      ),
      MUserDetail.create!(
        :last_name => "Last Name",
        :first_name => "First Name",
        :last_name_kana => "Last Name Kana",
        :first_name_kana => "First Name Kana",
        :encrypted_birth_date => "Encrypted Birth Date",
        :encrypted_mobile_no => "Encrypted Mobile No",
        :encrypted_tel_no => "Encrypted Tel No"
      )
    ])
  end

  it "renders a list of m_user_details" do
    render
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name Kana".to_s, :count => 2
    assert_select "tr>td", :text => "First Name Kana".to_s, :count => 2
    assert_select "tr>td", :text => "Encrypted Birth Date".to_s, :count => 2
    assert_select "tr>td", :text => "Encrypted Mobile No".to_s, :count => 2
    assert_select "tr>td", :text => "Encrypted Tel No".to_s, :count => 2
  end
end
