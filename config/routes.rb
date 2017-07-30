Rails.application.routes.draw do
  get 'newsletters/:id/deliver' , to: 'newsletters#deliver'
  resources :newsletters do
    member { post :deliver }
  end
  resources :subscribers
  get 'subscribers/show' , to:'subscribers#show'
  get '/' , to:'subscribers#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
