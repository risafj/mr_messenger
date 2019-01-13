# Make a separate controller for APIs when...
# You have some controllers that only use APIs and others that have a front end (in this case active admin).
class ApiController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
end
