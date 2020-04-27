class User < ApplicationRecord
    has_many :reviews
    has_many :favorites
    has_many :recipes, through: :favorites
end
