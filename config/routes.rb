Rails.application.routes.draw do

  devise_for :players, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  scope :cms, cms_scope: true do
    resources :players, :path => 'jogadores'
    resources :subjects, :path => 'assuntos'
    resources :questions, :path => 'questoes'
    resources :answers, :path => 'respostas'
    post 'juntar' => 'integrations#index'
    get 'juntar' => 'integrations#index'

    post 'juntar/:type/:answer_id/:question_id' => 'integrations#update'
    get '/' => 'welcome#index'
  end

  resources :rounds

  resources :games do
    resources :rounds do
      member do
        patch 'next'
      end
    end
  end

  devise_scope :player do
    get '/cadastrar' => 'devise/registrations#new'
    get '/entrar' => 'devise/sessions#new'
    get '/editar' => 'devise/registrations#edit'
    delete '/sair' => 'devise/sessions#destroy'
  end

  root 'welcome#index'
end
