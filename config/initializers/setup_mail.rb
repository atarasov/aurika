# coding: utf-8
ActionMailer::Base.smtp_settings = {
    :address              => "smtp.locum.ru",
    :port                 => 25,
    :domain               => "aurika-curkan.ru",
    :user_name            => "support@aurika-curkan.ru",
    :password             => "fehbrfwehrfy",
    :authentication       => "plain",
    :enable_starttls_auto => false
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?