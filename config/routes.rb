Rails.application.routes.draw do

  devise_for :players, skip: [:sessions, :registrations],
              controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :players

  scope :cms, cms_scope: true do
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

  root 'welcome#index'
end
