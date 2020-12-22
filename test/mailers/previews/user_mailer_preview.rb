# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome_trainer
  def welcome_user
    user = User.first
    UserMailer.with(user: user).welcome_user.deliver_now
  end

end
