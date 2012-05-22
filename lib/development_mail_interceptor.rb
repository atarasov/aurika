# coding: utf-8
class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject}"
    message.to = "lexa.tarasov@gmail.com"
  end
end

