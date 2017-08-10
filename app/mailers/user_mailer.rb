require 'mailgun'

class UserMailer < ApplicationMailer

  def event_email(user)
    @user = user
    @url  = 'https://urbgarden.herokuapp.com/users/sign_in'

    mail to: @user.email, subject: "Success! You did it."
    
  end
end
