Rails.application.routes.draw do
  resources :exercises
  
  get 'tags/:tag', to: 'exercises#index', as: :tag
  root to: "exercises#index"
end
