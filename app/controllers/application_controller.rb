class ApplicationController < ActionController::Base
  # The line below is to avoid InvalidAuthenticityToken error.
  # Based on this advice:
  # https://stackoverflow.com/questions/20875591/actioncontrollerinvalidauthenticitytoken-in-registrationscontrollercreate
  protect_from_forgery with: :null_session
end
