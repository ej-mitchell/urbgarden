require 'mailgun'

class UserMailer < ApplicationMailer

  def event_email(user)
    @user = user
    @url  = 'https://urbgarden.herokuapp.com/users/sign_in'

    mail to: @user.email, subject: "Success! You did it."

  end

  def order_email(user, grower, order)
    @recipients = [user, grower]
    @order = order
    @product_orders = order.product_orders
    @recipients.each do |addressee|
      mail to: addressee, subject: "New Order from UrbGarden"
    end
  end
end
