Rails.application.routes.draw do
  resources :students do
    get :subjects
  end

  get 'reports/subjects'


  devise_for :users

  devise_scope :user do
    root "devise/sessions#new"
  end

end
