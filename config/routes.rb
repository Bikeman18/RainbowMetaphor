Rails.application.routes.draw do
  resources :keys, except: [:new, :edit]
  resources :locks, except: [:new, :edit]
  resources :users, except: [:new, :edit] do
    resources :keys, except: [:new, :edit]
  end
end
