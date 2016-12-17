Rails.application.routes.draw do
  resources :team_memberships do
    member do
      get :join
    end
  end

  resources :teams do
    get :new_member
    post :create_member
    member do
      get :switch
    end
  end

  root 'interviews#index'

  get 'user_sessions/new'
  get 'user_sessions/create'
  get 'user_sessions/destroy'

  resources :categories
  resources :questions
  resources :editors, only: %i(show create)
  resources :interviews do
    member do
      get 'add_question'
      get 'conduct'
      get 'update_answer/:answer_id', action: :update_answer, as: :update_answer

      delete 'delete_answer/:answer_id', action: :delete_answer, as: :delete_answer

      patch 'rate_answer'

      post 'create_question/:question_id', action: :create_question, as: :create_question
      post 'load_to_editor/:answer_id', action: :load_to_editor, as: :load_to_editor
    end
  end

  resources :users
  resources :user_sessions

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
