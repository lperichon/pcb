ActionController::Routing::Routes.draw do |map|
  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.resources :user_sessions

  map.resources :users

  map.resource :test

  map.resources :cards
  map.root :controller => 'tests'

  map.connect ':lang/:controller/:action/:id'
  map.connect ':lang/:controller/:action/:id.:format'
end
