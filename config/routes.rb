ActionController::Routing::Routes.draw do |map|
  map.resource :test

  map.resources :cards
  map.root :controller => :tests

  map.connect ':lang/:controller/:action/:id'
  map.connect ':lang/:controller/:action/:id.:format'
end
