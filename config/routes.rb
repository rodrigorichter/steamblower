Rails.application.routes.draw do
  get 'home/index'
  get '/download_screenshots', to: 'home#download_screenshots'

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
