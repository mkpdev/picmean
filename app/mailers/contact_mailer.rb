class ContactMailer < ApplicationMailer
  default from: 'notifications@example.com'
  def contact_us(name, subject, email, message)
    @name = name
    @message = message
    @email = email
    mail(to: "adminshi@yopmail.com", subject: subject)
  end
end
