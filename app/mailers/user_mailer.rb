class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome_trainer.subject
  #
  def welcome_user
    @user = params[:user]
    mail(to: @user.email, subject: "Welcome to yance #{@user.first_name}!")
  end
end
