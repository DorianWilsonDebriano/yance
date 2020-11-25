class SportsClass < ApplicationRecord
  belongs_to :trainer

  searchkick word_start: %i[title trainer]
  # searchkick


  def search_data
    {
      title: title,
      description: description,
      trainer_first: trainer.user.first_name,
      trainer_last: trainer.user.last_name,
      duration: duration,
      experience_level: experience_level,
      category: category
    }
  end
end
