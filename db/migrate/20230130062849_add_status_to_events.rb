class AddStatusToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :is_archived, :boolean, :default => false
    add_column :events, :is_closed, :boolean, :default => false
  end
end
