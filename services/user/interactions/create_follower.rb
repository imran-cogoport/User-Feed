class CreateFollower < ActiveInteraction::Base
  string :user_id
  string :followed_by_user_id

  def execute
    user = User.where(id: self.user_id).take

    if user.blank?
      self.errors.add(:user, 'does not exist')
      return
    end

    follower = user.followers.create(followed_by_user_id: self.followed_by_user_id)

    if follower.errors.present?
      self.errors.merge!(follower.errors)
      return
    end

    return { id: follower.id }
  end
end