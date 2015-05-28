Rails.application.routes.draw do
  post    'login'   => 'sessions#new'

  resources :keychanges, except: [:new, :edit]
  resources :keys, except: [:new, :edit]
  resources :users, except: [:new, :edit] do
    resources :keys, except: [:new, :edit]
  end
end
