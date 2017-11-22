if Rails.env.development?

  config.action_mailer.perform_caching = false

    config.action_mailer.delivery_method = :smtp
    # SMTP settings for gmail
    config.action_mailer.smtp_settings = {
     :address              => "smtp.zoho.com",
     :port                 => 465,
     :user_name            => ENV['wrench_username'],
     :password             => ENV['wrench_password'],
     :authentication       => "plain",
    :enable_starttls_auto => true
    }
elsif Rails.env.production?

  config.action_mailer.perform_caching = false

    config.action_mailer.delivery_method = :smtp
    # SMTP settings for gmail
    config.action_mailer.smtp_settings = {
     :address              => "smtp.zoho.com",
     :port                 => 465,
     :user_name            => ENV['wrench_username'],
     :password             => ENV['wrench_password'],
     :authentication       => "plain",
    :enable_starttls_auto => true
    }

  end
