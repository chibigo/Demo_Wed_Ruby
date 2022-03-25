class User < ApplicationRecord
    
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
    validates :password,length: {:within => 8..40}, format: { with: PASSWORD_FORMAT }
end
