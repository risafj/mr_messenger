# Make a separate controller for APIs when...
# You have some controllers that only use APIs and others that have a front end (in this case active admin).
# Based on this advice:
# https://devise-token-auth.gitbook.io/devise-token-auth/faq#im-having-trouble-using-this-gem-alongside-activeadmin
class ApiController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
end
