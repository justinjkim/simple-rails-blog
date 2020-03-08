class Post < ApplicationRecord
  has_many :comments # in relationship to the Comment model
  validates :title, presence: true, length: {minimum: 5}
end
