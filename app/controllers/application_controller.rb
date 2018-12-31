class ApplicationController < ActionController::API
  before_action :set_cors
  include Response
  include ExceptionHandler


  def set_cors
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
  end
end
