Rails.application.routes.draw do

  devise_for :players, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :games, :path => 'jogos'
  resources :players, :path => 'jogadores'
  resources :subjects, :path => 'assuntos'
  resources :questions, :path => 'questoes'
  resources :answers, :path => 'respostas'

  post 'juntar', :controller => 'integrations', :action => 'index'
  get 'juntar', :controller => 'integrations', :action => 'index'

  devise_scope :player do
    get '/cadastrar' => 'devise/registrations#new'
    get '/entrar' => 'devise/sessions#new'
    get '/editar' => 'devise/registrations#edit'
    delete '/sair' => 'devise/sessions#destroy'
  end

  root 'welcome#index'
end
