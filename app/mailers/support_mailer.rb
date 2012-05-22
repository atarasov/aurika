# coding: utf-8
class SupportMailer < ActionMailer::Base
  default :from => "support@aurika-curkan.ru"

  def contact_confirmation(contact)
    @contact = contact
    mail(:to => "lexa.tarasov@gmail.com", :subject => "Новое приглашение")
  end
end
