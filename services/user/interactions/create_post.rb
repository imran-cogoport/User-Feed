class CreatePost < ActiveInteraction::Base
  string :user_id
  string :content
  integer :likes, default: 0
  integer :dislikes, default: 0

  def execute
    user = User.where(id: self.user_id).take

    if user.blank?
      self.errors.add(:user, 'does not exist')
      return
    end

    post = user.posts.create(content: self.content, likes: self.likes, dislikes: self.dislikes)

    if post.errors.present?
      self.errors.merge!(post.errors)
      return
    end

    return { id: post.id }
  end
end