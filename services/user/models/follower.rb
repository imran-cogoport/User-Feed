class Follower < ApplicationRecord
  has_many :posts, class_name: 'Post', primary_key: 'followed_by_user_id', foreign_key: 'user_id'
end