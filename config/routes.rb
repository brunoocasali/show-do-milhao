Rails.application.routes.draw do

  devise_for :players, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  scope :cms, cms_scope: true do
    resources :games, :path => 'jogos'
    resources :players, :path => 'jogadores'
    resources :subjects, :path => 'assuntos'
    resources :questions, :path => 'questoes'
    resources :answers, :path => 'respostas'
    post 'juntar', :controller => 'integrations', :action => 'index'
    get 'juntar', :controller => 'integrations', :action => 'index'

    get '/' => 'welcome#index'
  end


  devise_scope :player do
    get '/cadastrar' => 'devise/registrations#new'
    get '/entrar' => 'devise/sessions#new'
    get '/editar' => 'devise/registrations#edit'
    delete '/sair' => 'devise/sessions#destroy'
  end

  root 'welcome#index'
end
