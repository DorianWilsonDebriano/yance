class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.float :value
      t.boolean :status
      t.string :attachment
      t.references :trainer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
