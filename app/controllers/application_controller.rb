# coding: utf-8

# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout "main_layout"
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :authenticate_user!, :except => [:index, :show]
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end