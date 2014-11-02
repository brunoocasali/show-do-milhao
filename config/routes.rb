Rails.application.routes.draw do
  resources :subjects, :path => 'assuntos'
  resources :questions, :path => 'questoes'
  resources :answers, :path => 'respostas'

  post 'juntar', :controller => 'integrations', :action => 'index'
  get 'juntar', :controller => 'integrations', :action => 'index'

  root 'welcome#index'
end
