require 'rails_helper'

RSpec.describe "m_user_details/show", type: :view do
  before(:each) do
    @m_user_detail = assign(:m_user_detail, MUserDetail.create!(
      :last_name => "Last Name",
      :first_name => "First Name",
      :last_name_kana => "Last Name Kana",
      :first_name_kana => "First Name Kana",
      :encrypted_birth_date => "Encrypted Birth Date",
      :encrypted_mobile_no => "Encrypted Mobile No",
      :encrypted_tel_no => "Encrypted Tel No"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name Kana/)
    expect(rendered).to match(/First Name Kana/)
    expect(rendered).to match(/Encrypted Birth Date/)
    expect(rendered).to match(/Encrypted Mobile No/)
    expect(rendered).to match(/Encrypted Tel No/)
  end
end
