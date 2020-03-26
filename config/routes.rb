Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }  #do 

             #get '/users/sign_out' => 'devise/sessions#destroy' 

      #end
	root to: 'articles#index' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :articles do
  resources :comments 
end
resources :tags

post "reply_popup" =>"comments#reply_popup", as: :reply_popup
post "add_reply" =>"comments#add_reply", as: :add_reply
post "delete_comment" =>"comments#delete_comment", as: :delete_comment

end
