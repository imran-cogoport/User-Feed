class CreateUsersTable < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: :uuid, default: -> { 'gen_random_uuid()' } do |t|
      t.string :name
      t.string :email
      t.timestamps
    end

    create_table :posts, id: :uuid, default: -> { 'gen_random_uuid()' } do |t|
      t.string :content
      t.uuid :user_id
      t.integer :likes
      t.integer :dislikes
      t.timestamps
    end

    create_table :comments, id: :uuid, default: -> { 'gen_random_uuid()' } do |t|
      t.string :comment
      t.uuid :post_id
      t.timestamps
    end

    create_table :followers, id: :uuid, default: -> { 'gen_random_uuid()' } do |t|
      t.uuid :user_id
      t.uuid :followed_by_user_id
      t.timestamps
    end
  end
end
