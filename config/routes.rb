Fews::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :articles do
        member do
          post 'vote', action: :vote
        end
      end
      resources :sessions, only: [ :create, :destroy ]
    end
  end

end
