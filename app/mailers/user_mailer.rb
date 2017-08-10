class UserMailer < ApplicationMailer

  def event_email(user)
    @user = user
    @url  = 'https://urbgarden.herokuapp.com/users/sign_in'
    mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']
    message_params = {:from    => "urbgarden@example.com",
                      :to      => @user.email,
                      :subject => 'Sample Mail using Mailgun API',
                      :text    => 'This mail is sent using Mailgun API via mailgun-ruby'}
    mg_client.send_message ENV['domain'], message_params
  end
end
