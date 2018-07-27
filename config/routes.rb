Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/forecast', to: 'forecast#show'
  get '/direction', to: 'direction#show'
  get '/places', to: 'places#show'
end
