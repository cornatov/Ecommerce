class UserMailer < ApplicationMailer
  default from: "email@something.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
         :to => 'cornatov@buffalo.edu',
         :subject => "A new contact form message from #{user.first_name}")
  end

def welcome_email(user)
     @user = user
       mail(:from => 'cornatov@buffalo.edu',
         :to => user.email,
         :subject => "Welcome and thank you #{user.first_name} for joining!")
 end


end