class User < ApplicationRecord
    
    attr_accessor:remember_token

    before_save {self.email = email.downcase }
    validates :name,length: {maximum:50},presence:true
    validates :email,length: {maximum:100}, presence: true, format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
    uniqueness: {case_sensitive:false}
    has_secure_password
    PASSWORD_FORMAT = /\A
        (?=.{8,})          # Must contain 8 or more characters
        (?=.*\d)           # Must contain a digits
        (?=.*[A-Z])        # Must contain an upper case character
    /x
    validates :password,length: {:within => 8..40}, format: { with: PASSWORD_FORMAT }, allow_blank: true

    class << self
        # Returns the hash digest of the given string.
        def digest(string)
            cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
            BCrypt::Password.create(string,cost: cost)
        end

        # Returns a random token.
        def new_token 
            SecureRandom.urlsafe_base64
        end

    end

    # Remembers a user in the database for use in persistent sessions.
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    # Returns true if the given token matches the digest.
    def authenticated? (remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    # Forgets a user.
    def forget 
        update_attribute(:remember_digest, nil)
    end
end
