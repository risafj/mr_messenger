# This code can only be called inside tests because HTTP request verbs are only available for tests.

module AuthorizationHelper
  def sign_up(user)
    post '/auth/',
         params: { email: user[:email],
                   password: user[:password],
                   password_confirmation: user[:password] },
         as: :json
  end

  def get_auth_headers(user)
    post '/auth/sign_in/',
         params: { email: user[:email], password: user[:password] },
         as: :json
    response.headers.slice('client', 'access-token', 'uid')
  end
end
