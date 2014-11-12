Rails.application.routes.draw do

  devise_for :players, skip: [:sessions, :registrations],
              controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  scope :cms, cms_scope: true do
    resources :subjects, :path => 'assuntos'
    resources :questions, :path => 'questoes'
    get '/' => 'welcome#index'
  end

  resources :players
  resources :rounds

  resources :games do
    resources :rounds do
      member do
        patch 'next'
        patch 'jump'
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
