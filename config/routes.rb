Rails.application.routes.draw do
  root to: 'stocks#index'
  resources :stocks, only: [:show]
  get '/stocks/:id/get_strategy_numbers', to: 'stocks#get_strategy_numbers', as: 'strategies'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
