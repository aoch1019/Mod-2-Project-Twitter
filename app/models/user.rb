class User < ApplicationRecord
  has_many :tweets
  accepts_nested_attributes_for :tweets

  validates :email, uniqueness: {case_sensitive: false}
  validates :email, length: {minimum: 4}
  validates :name, length: {minimum: 2}

end
