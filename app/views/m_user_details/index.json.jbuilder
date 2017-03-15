json.array!(@m_user_details) do |m_user_detail|
  json.extract! m_user_detail, :id, :last_name, :first_name, :last_name_kana, :first_name_kana, :encrypted_birth_date, :encrypted_mobile_no, :encrypted_tel_no
  json.url m_user_detail_url(m_user_detail, format: :json)
end
