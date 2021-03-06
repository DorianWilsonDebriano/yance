class AddInvoicePaidToTrainers < ActiveRecord::Migration[6.0]
  def change
    add_column :trainers, :invoice_paid, :boolean
  end
end
