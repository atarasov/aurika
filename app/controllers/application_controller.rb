# coding: utf-8

# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout "main_layout"
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :authenticate_user!, :except => [:index, :show, :about, :about_dance, :help, :payment, :schedule, :camp_sheld]
  before_filter :sape_init

  def sape_init
    @sape = Sape.from_request('7d4a626bcf75dd761fe8e660627a47d3', request)
  end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
