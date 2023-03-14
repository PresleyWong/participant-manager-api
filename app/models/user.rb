class User < ApplicationRecord
    has_many :appointments, dependent: :destroy

    has_secure_password

    validates :email, presence: true, uniqueness: true
    # validates :password, presence: true

    validates :password, length: { minimum: 5 }, if: :password_required?

    def as_json(options = {})
        super.merge('updated_at' => self.updated_at.strftime("%F %I:%M %p"), 
                    'created_at' => self.created_at.strftime("%F %I:%M %p"))
    end


    def enforce_password_validation
        @enforce_password_validation = true
    end

    private

    def password_required?
        password.present?
    end
end
