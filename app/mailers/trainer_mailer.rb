class TrainerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.trainer_mailer.welcome_trainer.subject
  #
  def welcome_trainer
    @trainer = params[:trainer]
    mail(to: @trainer.user.email, subject: "Welcome to yance #{@trainer.user.first_name}!")
  end
end
