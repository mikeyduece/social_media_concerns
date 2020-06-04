SocialMedia::Engine.routes.draw do
  resources :likes, only: %i[create destroy]
end
