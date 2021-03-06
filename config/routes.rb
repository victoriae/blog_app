Rails.application.routes.draw do
  resources :youtube, only: :show
  resources :comments
  resources :articles
  resources :categories
  devise_for :users,
              path: '',
              path_names: {
                sign_in: 'login',
                sign_out: 'logout',
                password: 'secret',
                registration: 'register',
                sign_up: 'signup'
              },
              controllers: {
                registrations: 'users/registrations'
              }

  root 'pages#home'
end
