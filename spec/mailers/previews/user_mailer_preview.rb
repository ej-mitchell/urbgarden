# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def event_email_preview
    UserMailer.event_email(User.last)
  end
end
