Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  apis = %w[create_user create_comment create_follower create_post list_feeds update_post]

  post "user/create_user" => "application#create_user"
  post "user/create_comment" => "application#create_comment"
  post "user/create_follower" => "application#create_follower"
  post "user/create_post" => "application#create_post"
  post "user/update_post" => "application#update_post"
  get "user/list_feeds" => "application#list_feeds"

  apis.each do |api|
    ApplicationController.define_method api.to_sym do
    end
  end
end
