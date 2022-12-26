class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references  :participant, null: false, foreign_key: true
      t.references  :event, null: false, foreign_key: true
      t.references  :user, null: false, foreign_key: true
      t.string :language, null: false 
      t.text :remarks
      t.timestamps
    end

    add_index :appointments, [:participant_id, :event_id], unique: true
  end
end
