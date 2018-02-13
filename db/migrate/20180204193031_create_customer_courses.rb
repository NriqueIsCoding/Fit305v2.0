class CreateCustomerCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_courses do |t|
      t.references :customer, foreign_key: true
      t.references :course, foreign_key: true
    end
  end
end
