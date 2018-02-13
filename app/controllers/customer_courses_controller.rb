class CustomerCoursesController < ApplicationController
  def create
    customer_course = CustomerCourse.new
    customer_course.customer_id = current_customer.id
    customer_course.course_id = params[:course_id]
    customer_course.save
    # redirect_to customer_path(current_customer.id)
    redirect_to new_charge_path(:course => customer_course.course.price)
  end
end
