class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_instructor
  helper_method :current_customer

  def current_instructor
    @current_instructor ||=Instructor.find(session[:instructor_id]) if session[:instructor_id]
  end

  def current_customer
    @current_customer ||=Customer.find(session[:customer_id]) if session[:customer_id]
  end

  def authorize_customer
     redirect_to(root_path, notice: "You must be logged in as a customer to accesss this page") unless current_customer
  end

  def authorize_instructor

     redirect_to(root_path, notice: "You must be logged in as an instructor to accesss this page") unless current_instructor
  end
  def authorize_user
    # inspect whether user is logged in as instructor or customer
    # if not, return false
    if current_customer
      return authorize_customer
    elsif current_instructor
      return authorize_instructor
    end
     return false

  end
end
