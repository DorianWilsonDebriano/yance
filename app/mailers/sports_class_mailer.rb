class SportsClassMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sports_class_mailer.new_class_confirmation.subject
  #
  def new_class_confirmation
    @trainer = params[:trainer]
    @sportsclass = params[:sports_class]
    mail(to: @trainer.user.email, subject: "#{@trainer.user.first_name}, your class was successfully created!")
  end
end
