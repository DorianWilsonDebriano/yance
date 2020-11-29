class RemoveSportsClassReferenceFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_reference :reviews, :sports_class, index: true, foreign_key: true
  end
end
