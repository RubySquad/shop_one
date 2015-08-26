# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome_letter
    UserMailer.welcome_letter('a@b.com', 'John', 'Smith')
  end
end
