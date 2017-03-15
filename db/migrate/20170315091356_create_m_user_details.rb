class CreateMUserDetails < ActiveRecord::Migration
  def change
    create_table :m_user_details do |t|
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.string :encrypted_birth_date
      t.string :encrypted_mobile_no
      t.string :encrypted_tel_no

      t.timestamps null: false
    end
  end
end
