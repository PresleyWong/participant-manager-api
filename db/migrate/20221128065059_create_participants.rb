class CreateParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :participants do |t|
      t.string :gender, null: false 
      t.string :english_name, null: false 
      t.string :chinese_name
      t.string :email
      t.integer :phone, :limit => 8
      t.string :college
      t.integer :academic_year
      t.string :locality, null: false 
      t.timestamps
    end

    add_index :participants, :email, unique: true
  end
end
