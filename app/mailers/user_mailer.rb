class UserMailer < ApplicationMailer
  default from: "cornatov@buffalo.edu"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
         :to => 'cornatov@buffalo.edu',
         :subject => "A new contact form message from #{name}")
  end
end