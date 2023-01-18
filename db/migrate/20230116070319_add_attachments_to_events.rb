class AddAttachmentsToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :attachments, :json
  end
end
