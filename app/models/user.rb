class User < ApplicationRecord
    has_many :appointments, dependent: :destroy

    has_secure_password

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true

    def as_json(options = {})
        super.merge('updated_at' => self.updated_at.strftime("%F %I:%M %p"), 
                    'created_at' => self.created_at.strftime("%F %I:%M %p"))
    end
end
