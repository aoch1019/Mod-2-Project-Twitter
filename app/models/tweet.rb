class Tweet < ApplicationRecord
  belongs_to :user

  validates :content, length: {minimum: 1}
  validates :content, length: {maximum: 250}
end
