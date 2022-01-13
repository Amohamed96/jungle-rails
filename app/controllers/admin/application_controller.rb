class Admin::ApplicationController < ApplicationController
  before_action :authenticated?
  
  def authenticated?
    authenticate = authenticate_with_http_basic do |u, p|
      u == ENV["HTTP_BASIC_USER"] && ENV["HTTP_BASIC_PASSWORD"] 
    end
    request_http_basic_authentication unless authenticate
  end
end