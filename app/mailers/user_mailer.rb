class UserMailer < ApplicationMailer

   

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  def password_reset
    @greeting = "Welcome to Ruby"

    mail to: "viet2000yyy@gmail.com"
  end
end
