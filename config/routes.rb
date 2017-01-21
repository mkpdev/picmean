Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'home#index'
  get '/about_us'=>"home#about_us"
  get '/contact_us'=>"home#contact_us"
  get '/tutorial'=>"home#tutorial"
end
