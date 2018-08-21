class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :content, length: {minimum: 1}
  validates :content, length: {maximum: 250}


  def num_likes
    self.likes.count
  end

end
