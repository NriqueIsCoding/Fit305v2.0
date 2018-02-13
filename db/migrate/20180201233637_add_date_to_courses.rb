class AddDateToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :date, :date
  end
end
