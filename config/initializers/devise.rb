Devise.setup do |config|

  config.secret_key = '10539cd48cd054fd9efc80aa609dc329680fd5e4149149c5fb16a752533064e1f20521e93c42e80e8da2226e8cdd2f4a3cee7c18ebf5ea3494844bb3b77af3aa'

  config.mailer_sender = 'brunoocasali@gmail.com'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [ :email ]

  config.strip_whitespace_keys = [ :email ]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true

  config.password_length = 8..128

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  config.sign_out_via = :get

  config.omniauth :facebook, '873747422659195', '6622234bfe75759c0e37e4943b173dd9',
                  {scope: 'email, offline_access', provider_ignores_state: true,
                   client_options: {ssl: {ca_file: '/usr/lib/ssl/certs/ca-certificates.crt'}}}

  config.omniauth :twitter,  'Y2RZXSgv8gLY3kccA0fE5v6M7',
                  'rGJjkp5VwJgik2sQKYBEpAW5YGS9I6jWfvxYxZLG6M2NNYyLuq',
                  {:scope => 'r_fullprofile, r_emailaddress', :client_options =>
                      {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}

end
