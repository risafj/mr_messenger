# Copied from here, except change "secrets" to "credentials" due to Rails version change:
# https://www.twilio.com/blog/2017/12/send-sms-ruby-rails-5-coffee.html

Twilio.configure do |config|
  config.account_sid = Rails.application.credentials.twilio_account_sid
  config.auth_token = Rails.application.credentials.twilio_auth_token
end

# Defining a camelCase variable like below in initializers allows you to access the variable in other files.
# Similar to using a module.
TwilioClient = Twilio::REST::Client.new
