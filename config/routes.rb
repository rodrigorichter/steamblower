Rails.application.routes.draw do
  get 'home/index'
  get '/get_screenshot_url', to: 'home#get_screenshot_url'

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
