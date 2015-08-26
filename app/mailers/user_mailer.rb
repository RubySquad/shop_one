class UserMailer < ApplicationMailer

  default from: "no-reply@rocky-river-5952.herokuapp.com"

  def welcome_letter(user_email, name, surname)
    @name = name
    @surname = surname
    mail to: user_email, subject: 'Welcome to the SHOP ONE delivery service'
  end
end
