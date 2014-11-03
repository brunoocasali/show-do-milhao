Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :users
  resources :subjects, :path => 'assuntos'
  resources :questions, :path => 'questoes'
  resources :answers, :path => 'respostas'

  post 'juntar', :controller => 'integrations', :action => 'index'
  get 'juntar', :controller => 'integrations', :action => 'index'

  root 'welcome#index'
end
