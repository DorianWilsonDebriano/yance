# Preview all emails at http://localhost:3000/rails/mailers/sports_class_mailer
class SportsClassMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sports_class_mailer/new_class_confirmation
  def new_class_confirmation
    trainer = Trainer.first
    sportsclass = SportsClass.first
    SportsClassMailer.with(trainer: trainer, sports_class: sportsclass).new_class_confirmation.deliver_now
  end

end
