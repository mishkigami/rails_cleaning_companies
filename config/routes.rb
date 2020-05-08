Rails.application.routes.draw do
 

 namespace :api do
  namespace :v1 do
    resources :company, only: [:index, :show]
  end
 end

 scope module: :web do
   root to: 'welcome#index'

    namespace :admin do
      resource :session, only: [:new, :create, :destroy]
        root 'welcome#index'
        resources :admins do
          put 'restore'
          put 'del'
        end
        resources :companies do
          put 'restore'
          put 'del'
        end
        resources :clients do
          put 'restore'
          put 'del'
        end
        resources :cities
        resources :articles
        resources :services
    end  

    namespace :company do
      resource :session, only: [:new, :create, :destroy]
      resource :profile, only: [:show, :edit, :update]
    end
  end
end