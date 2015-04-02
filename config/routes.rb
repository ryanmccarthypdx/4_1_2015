Rails.application.routes.draw do

  resources :contacts
  devise_for :users

  resources :users, :except => :index
  resources :messages


  devise_scope :user do
    authenticated :user do
      root 'users#show', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
