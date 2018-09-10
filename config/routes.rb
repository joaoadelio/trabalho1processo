Rails.application.routes.draw do

  resources :books
  resources :libraries
  resources :bookcases
  resources :languages
  resources :disciplines
  root 'libraries#homepage'

  resources :libraies do
    collection do
      get 'homepage'
      post 'homepage'
    end

  end


  devise_for :users



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
