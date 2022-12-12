class Participant < ApplicationRecord
    has_many :appointments, dependent: :destroy
    has_many :events, through: :appointments

    scope :filtered_by_non_admin, ->(query, locality) { where("english_name ILIKE ?", "%#{query}%").where('locality IN (?)', locality) }
    scope :filtered_by_admin, ->(query) { where("english_name ILIKE ?", "%#{query}%") }

    def as_json(options = {})
        super.merge('updated_at' => self.updated_at.strftime("%F %I:%M %p"), 
                    'created_at' => self.created_at.strftime("%F %I:%M %p"))
    end
end
