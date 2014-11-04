Rails.application.routes.draw do

  devise_for :players, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :games, :path => 'jogos'
  resources :players, :path => 'jogadores'
  resources :subjects, :path => 'assuntos'
  resources :questions, :path => 'questoes'
  resources :answers, :path => 'respostas'

  post 'juntar', :controller => 'integrations', :action => 'index'
  get 'juntar', :controller => 'integrations', :action => 'index'

  root 'welcome#index'
end
