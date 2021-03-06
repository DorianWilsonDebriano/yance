class AddTotalRevenuesToTrainers < ActiveRecord::Migration[6.0]
  def change
    add_column :trainers, :total_revenues, :integer
  end
end
