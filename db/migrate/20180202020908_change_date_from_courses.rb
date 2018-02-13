class ChangeDateFromCourses < ActiveRecord::Migration[5.1]
  def change
    change_column :courses, :date, :string
  end
end
