class Event < ApplicationRecord
    mount_uploaders :attachments, AttachmentUploader
    has_many :appointments, dependent: :destroy
    has_many :participants, through: :appointments

    scope :filtered_by_search, ->(query) { where("title ILIKE ?", "%#{query}%") }

    def as_json(options = {})
        super.merge('start_date' => self.start_date.strftime("%F"), 
                    'end_date' => self.end_date.strftime("%F"),
                    'start_time' => self.start_time.strftime("%H:%M"),
                    'end_time' => self.end_time.strftime("%H:%M"),                   
                    'updated_at' => self.updated_at.strftime("%F %I:%M %p"), 
                    'created_at' => self.created_at.strftime("%F %I:%M %p"))
    end
end


