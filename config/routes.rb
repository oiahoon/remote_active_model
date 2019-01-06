Rails.application.routes.draw do
  resources :remote_active_models do
    collection do
      post :query
      get :menu
      get :consume
    end
  end
end