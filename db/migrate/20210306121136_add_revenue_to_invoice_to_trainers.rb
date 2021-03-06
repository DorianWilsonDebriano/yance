class AddRevenueToInvoiceToTrainers < ActiveRecord::Migration[6.0]
  def change
    add_column :trainers, :revenue_to_invoice, :integer
  end
end
