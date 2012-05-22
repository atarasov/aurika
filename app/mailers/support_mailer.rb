# coding: utf-8
class SupportMailer < ActionMailer::Base
  default :from => "support@aurika-curkan.ru"

  def contact_confirmation(contact)
    @contact = contact
    mail(:to => "richie76@mail.ru", :subject => "Новое приглашение")
  end
end
