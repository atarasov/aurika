# coding: utf-8
AuricaCurkan::Application.routes.draw do
  devise_for :users do
    get "sign_in", :to => "devise/sessions#new"


    #mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

    resources :contacts
    resources :events
    root :to => 'main#index'
    match '/logout' => 'sessions#destroy', :as => :logout
    match '/login' => 'sessions#new', :as => :login
    match '/register' => 'users#create', :as => :register
    match '/signup' => 'users#new', :as => :signup
    #resources :users
    resource :session
    match '/foto' => 'fotos#index', :as => :foto_index
    match '/video' => 'videos#index', :as => :video_index
    match '/about' => 'main#about', :as => :about_index
    match '/schedule' => 'main#schedule', :as => :schedule
    match '/payment' => 'main#payment', :as => :payment
    match '/camp_scheld' => 'main#camp_scheld', :as => :camp_scheld
    match '/help' => 'main#help', :as => :help
    match '/dance' => 'main#about_dance', :as => :about_dance_index
    resources :videos
    resources :foto_albums
    resources :collectives
    resources :fotos do
      collection do
        post :swfupload
      end


    end

    resources :foto_albums
    resources :news
  end
  match '/:controller(/:action(/:id))'
end
