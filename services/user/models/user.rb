class User < ApplicationRecord
  has_many :posts, class_name: 'Post'
  has_many :followers, class_name: 'Follower'
end