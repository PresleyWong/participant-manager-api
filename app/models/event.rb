class Event < ApplicationRecord
    has_many :appointments, dependent: :destroy
    has_many :participants, through: :appointments

    scope :filtered_by_search, ->(query) { where("title ILIKE ?", "%#{query}%") }
end
