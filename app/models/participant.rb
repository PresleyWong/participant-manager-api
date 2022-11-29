class Participant < ApplicationRecord
    has_many :appointments
    has_many :events, through: :appointments

    scope :filtered_by_non_admin, ->(query, locality) { where("english_name ILIKE ?", "%#{query}%").where('locality IN (?)', locality) }
    scope :filtered_by_admin, ->(query) { where("english_name ILIKE ?", "%#{query}%") }
end
