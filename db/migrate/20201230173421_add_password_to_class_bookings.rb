class AddPasswordToClassBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :class_bookings, :password, :string
  end
end
