Rails.application.routes.draw do
  post 'messages/', to: 'messages#create'
  delete 'messages/:id/', to: 'messages#delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
