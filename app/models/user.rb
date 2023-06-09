class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    before_save :downcase_email
    before_create :create_activation_digest
    validates :name, presence: true, length: {maximum: 50}
    validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
    validates :password, presence: true, length: {minimum: 6}, allow_nil: true

    has_secure_password
    attr_accessor :remember_token, :activation_token, :reset_token

    class << self
        # Returns the hash digest of the given string.
        def digest string
            cost = if ActiveModel::SecurePassword.min_cost
                        BCrypt::Engine::MIN_COST
                   else
                        BCrypt::Engine.cost
                   end
            BCrypt::Password.create string, cost: cost
        end

        def new_token
            SecureRandom.urlsafe_base64
        end
    end

    def remember
        self.remember_token = User.new_token
        update_column :remember_digest, User.digest(remember_token)
    end

    def authenticate? remember_token
        BCrypt::Password.new(remember_digest).is_password? remember_token
    end

    def forget
        update_column :remember_digest, nil
    end

    def authenticated? attribute, token
        digest = send "#{attribute}_digest"
        return false unless digest
        BCrypt::Password.new(digest).is_password? token
    end

    # Activates an account.
    def activate
        update_columns activated: true, activated_at: Time.zone.now
    end
    # Sends activation email.
    def send_activation_email
        UserMailer.account_activation(self).deliver_now
    end

    private

    def downcase_email
        self.email.downcase!
    end
    def create_activation_digest
        self.activation_token = User.new_token
        self.activation_digest = User.digest(activation_token)
    end

end
