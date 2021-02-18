Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post "/messages", to: "messages#create"
      get "/messages/:recipient_id", to: "messages#show"
    end
  end
end
