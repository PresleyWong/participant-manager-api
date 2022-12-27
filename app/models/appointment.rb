class Appointment < ApplicationRecord
    belongs_to :participant
    belongs_to :event
    belongs_to :user

    validates :language, presence: true, allow_blank: false

    def as_json(options = {})
        super.merge('updated_at' => self.updated_at.strftime("%F %I:%M %p"), 
                    'created_at' => self.created_at.strftime("%F %I:%M %p"))
    end
end
