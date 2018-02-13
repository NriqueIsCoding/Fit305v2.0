class AddAddressInfoToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :address, :string
    add_column :courses, :address2, :string
    add_column :courses, :city, :string
    add_column :courses, :state, :string
    add_column :courses, :zip, :string
  end
end
