class User < ApplicationRecord
    has_secure_password 
    #this comes from bcrypt, when you put your password, he will hash it and secure it
    validates :username, uniqueness: {case_sensitive: false}
    has_many :reviews
    has_many :favorites
    has_many :recipes, through: :favorites
end
