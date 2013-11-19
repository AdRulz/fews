Fews::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :articles do
        collection do
          get 'my', action: :my
        end
        member do
          post 'vote', action: :vote
        end
      end
      resources :sessions, only: [ :create, :destroy ]
    end
  end

end
