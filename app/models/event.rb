class Event < ApplicationRecord
    has_many_attached :attachments
    has_many :appointments, dependent: :destroy
    has_many :participants, through: :appointments

    scope :filtered_by_search, ->(query) { where("title ILIKE ?", "%#{query}%") }

    # after_save :set_filename, if: :attachments_attached?

    # def attachments_attached?
    #     attachments.attached?
    # end  

    def attachments=(attachables)
        attachables = Array(attachables).compact_blank

        if attachables.any?
            attachment_changes["attachments"] = ActiveStorage::Attached::Changes::CreateMany.new("attachments", self, attachments.blobs + attachables)
        end
    end


    def as_json(options = {})
        super.merge('start_date' => self.start_date.strftime("%F"), 
                    'end_date' => self.end_date.strftime("%F"),
                    'start_time' => self.start_time.strftime("%H:%M"),
                    'end_time' => self.end_time.strftime("%H:%M"),                   
                    'updated_at' => self.updated_at.strftime("%F %I:%M %p"), 
                    'created_at' => self.created_at.strftime("%F %I:%M %p"))
    end


    # private

    # def set_filename
    #     attachments.blobs.each do |file|            
    #         file.update(key: "#{title}-#{file.filename.to_s.split(".")[0]}")
    #     end
    # end
end





