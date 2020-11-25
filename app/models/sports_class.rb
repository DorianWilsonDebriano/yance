class SportsClass < ApplicationRecord
  belongs_to :trainer

  searchkick

  def search_data
    {
      title: title,
      description: description,
      trainer: self.trainer,
      duration: duration,
      experience_level: experience_level,
      category: category
    }
  end
end
