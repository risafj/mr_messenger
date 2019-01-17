# Mr. Messenger

Mr. Messenger is a Rails API application for scheduling text messages, using [Twilio](https://twilio.kddi-web.com/).<br>
You can schedule any reminders or messages to be sent to yourself or your friends. The app saves them in the database and sends them out at the designated time.

# Motivation
I created this app because it seemed like a fun project, and I wanted to gain experience connecting my code to external services. It has also helped me learn how to set up an authentication system and admin panel.

# Dependencies
## Twilio
   The [version](https://twilio.kddi-web.com/) I used is Twilio for the Japanese region, but it should also be compatible with the [US version](https://www.twilio.com/) as well.
   In order to run this code, it is necessary to set up a Twilio account and purchase a phone number that lets you send text messages.

   Then, you need to add your Twilio credentials to credentials.yml.enc like this:

   ```
   secret_key_base: # a long string should already be here - leave untouched
   twilio_account_sid: # check your twilio dashboard
   twilio_auth_token: # check your twilio dashboard
   twilio_phone_number: # number you purchased like "+1233456789"
   ```



# Tech Notes
- DB: MySQL
- Batch messages are sent out via cron jobs, set up using [whenever](https://github.com/javan/whenever)
- [Active Admin](https://github.com/activeadmin/activeadmin) for message management
- [devise_token_auth](https://github.com/lynndylanhurley/devise_token_auth) for authentication