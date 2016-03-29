Zenkai::Application.routes.draw do
  root to: 'tickets#dashboard'

  devise_for :users
  get 'api/pending_estimates', to: 'Api#pending_estimates'
  post 'api/tickets/create', to: 'Api#create_ticket'

  resources :tickets do
    collection do
      get :dashboard
      get :list
      get :pending
      get :estimate_pending
      get :current
      get :report
    end

    member do
      put :estimate
      put :re_estimate
      get :estimates
      post :ignore
    end
  end

  resources :projects

  resources :users do
    member do
      post :approve
    end
  end

  resources :user_ticket_estimates

end
