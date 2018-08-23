class User < ApplicationRecord
  has_many :tweets
  has_many :active_relationships, class_name:  "Relationship",
                                foreign_key: "follower_id",
                                dependent:   :destroy

  has_many :passive_relationships, class_name:  "Relationship",
                                foreign_key: "followed_id",
                                dependent:   :destroy

  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  accepts_nested_attributes_for :tweets
  has_secure_password

  validates :email, uniqueness: {case_sensitive: false}
  validates :email, length: {minimum: 4}
  validates :name, length: {minimum: 2}


  # Follows a user.
  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  def tweets_followed
    tweets_array = []
    following.each do |user|
      user.tweets.each do |tweet|
        tweets_array << tweet
      end
    end
    return tweets_array
  end

end
