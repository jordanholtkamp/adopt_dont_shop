Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'shelters#index'
  get '/shelters', to: 'shelters#index'
end
