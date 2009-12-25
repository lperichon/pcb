# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  def logged_in?
    false
  end

  # start over if test abandoned for more than 1 hour, or if there are no more incorrect or ananwered questions
  def start_over?
    ping = nil
    ping = DateTime.parse(cookies[:ping]) if cookies[:ping]

    return ping.nil? || ping < 1.hour.ago
  end
end
