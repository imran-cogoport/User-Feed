class ListFeeds < ActiveInteraction::Base
  string :id

  def execute
    query = get_query

    data = get_data(query)

    return { list: data }
  end

  def get_query
    User.where(id: self.id)
  end

  def get_data(query)
    query.includes(:followers, :posts).as_json(include: { followers: { posts: {} }, posts: { comments: {} } })
  end
end