class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.boolean :is_admin, default: false
      t.string :locality
      t.string :english_name
      t.string :chinese_name
      t.string :combine_name
      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
