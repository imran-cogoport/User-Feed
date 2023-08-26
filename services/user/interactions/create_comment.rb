class CreateComment < ActiveInteraction::Base
  string :post_id
  string :comment

  def execute
    post = Post.where(id: self.post_id).take

    if post.blank?
      self.errors.add(:post, 'does not exist')
      return
    end

    comment = post.comments.create(comment: self.comment)

    if comment.errors.present?
      self.errors.merge!(comment.errors)
      return
    end

    return { id: comment.id }
  end
end