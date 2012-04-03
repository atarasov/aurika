# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
#require ::File.expand_path('../lib/devise_basic_auth_fix', __FILE__)
ENV["GEM_HOME"]=%x{"source ~/.bash_profile ; rvm 1.9.2@9590 ; rvm gemdir"}.strip
#use DeviseBasicAuthFix
run AuricaCurkan::Application
