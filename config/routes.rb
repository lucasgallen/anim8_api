Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      get   'session_groups/new_session', to: 'session_group#new_session'
      get   'session_group/:slug', to: 'session_group#show', as: 'session_group'
      patch 'shared_image/:slug', to: 'shared_image#update', as: 'shared_image_update'
    end
  end
end
