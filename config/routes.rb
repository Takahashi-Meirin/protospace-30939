Rails.application.routes.draw do
  devise_for :users

  # localhost:3000にアクセスすると、prototypes_controllerのindexアクションが呼び出される。
  root to: "prototypes#index"

  # commentsコントローラーのcreateアクションに対するルーティング
  resources :prototypes do
    resources :comments, only: [:create]
  end

  # usersコントローラーのshowアクションに対するルーティング
  resources :users, only: [:new, :edit, :update, :show]

  # newアクションとcreateアクションに対するルーティング
  resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy]

end
