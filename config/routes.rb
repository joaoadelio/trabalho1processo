Rails.application.routes.draw do
  resources :devolutions
  resources :loans do
    collection do
      get 'devolver'
      post 'devolver'
    end
  end
  resources :bookings do
    collection do
      get 'converterReserva'
      post 'converterReserva'
    end
  end
  root to: redirect('/loans/')

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
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
