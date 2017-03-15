require 'rails_helper'

RSpec.describe "m_user_details/edit", type: :view do
  before(:each) do
    @m_user_detail = assign(:m_user_detail, MUserDetail.create!(
      :last_name => "MyString",
      :first_name => "MyString",
      :last_name_kana => "MyString",
      :first_name_kana => "MyString",
      :encrypted_birth_date => "MyString",
      :encrypted_mobile_no => "MyString",
      :encrypted_tel_no => "MyString"
    ))
  end

  it "renders the edit m_user_detail form" do
    render

    assert_select "form[action=?][method=?]", m_user_detail_path(@m_user_detail), "post" do

      assert_select "input#m_user_detail_last_name[name=?]", "m_user_detail[last_name]"

      assert_select "input#m_user_detail_first_name[name=?]", "m_user_detail[first_name]"

      assert_select "input#m_user_detail_last_name_kana[name=?]", "m_user_detail[last_name_kana]"

      assert_select "input#m_user_detail_first_name_kana[name=?]", "m_user_detail[first_name_kana]"

      assert_select "input#m_user_detail_encrypted_birth_date[name=?]", "m_user_detail[encrypted_birth_date]"

      assert_select "input#m_user_detail_encrypted_mobile_no[name=?]", "m_user_detail[encrypted_mobile_no]"

      assert_select "input#m_user_detail_encrypted_tel_no[name=?]", "m_user_detail[encrypted_tel_no]"
    end
  end
end
