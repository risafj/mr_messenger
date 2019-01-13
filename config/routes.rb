Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount_devise_token_auth_for 'User', at: 'auth'
  post 'messages/', to: 'messages#create'
  delete 'messages/:id/', to: 'messages#delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
