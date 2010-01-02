# CRUD controller for cards
class CardsController < InheritedResources::Base
  before_filter :login_required
end
