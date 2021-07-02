Invitation.configure do |config|
  #config.routes = false 
   config.user_model = '::User'
  config.user_registration_url = ->(params) { Rails.application.routes.url_helpers.user_registration_url(params) }
  config.mailer_sender = 'reply@example.com'
  config.routes = true
   config.case_sensitive_email = true
end