class UpdatePost < ActiveInteraction::Base
  string :id
  integer :likes
  integer :dislikes

  def execute
    post = Post.where(id: self.id).take

    if post.blank?
      self.errors.add(:post, 'does not exist')
      return
    end

    post.update(likes: (post.likes + self.likes), dislikes: (post.dislikes + self.dislikes))

    if post.errors.present?
      self.errors.merge!(post.errors)
      return
    end

    return { id: post.id }
  end
end