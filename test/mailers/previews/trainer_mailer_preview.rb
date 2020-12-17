# Preview all emails at http://localhost:3000/rails/mailers/trainer_mailer
class TrainerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/trainer_mailer/welcome_trainer
  def welcome_trainer
    trainer = Trainer.first
    TrainerMailer.with(trainer: trainer).welcome_trainer.deliver_now
  end

end
