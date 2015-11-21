class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  # this attaches (server-side) a secret token to all non-GET requests
  # (form submissions) and then verifies (on receipt of the request)
  # that the token was included with it.
  protect_from_forgery with: :exception
  include SessionsHelper
end
