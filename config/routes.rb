Rails.application.routes.draw do
  resources :students do
    get :subjects
  end

  get 'reports/subjects', as: 'report_subjects'

  resources :teachers do
    resources :subjects
  end

  devise_for :users, controllers: {registrations: 'registrations'}

  get 'visitors/index'

  devise_scope :user do
    root "devise/sessions#new"
  end

end
