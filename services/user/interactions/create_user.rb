class CreateUser < ActiveInteraction::Base
  string :name
  string :email

  def execute
    user = User.find_or_initialize_by(email: self.email)

    user.assign_attributes(name: self.name)

    unless user.save
      self.errors.merge!(user.errors)
      return
    end

    return { id: user.id }
  end
end