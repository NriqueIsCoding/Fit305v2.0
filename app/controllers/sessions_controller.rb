class SessionsController < ApplicationController

  def new
     redirect_to "/" if logged_in?
  end

  def create

    instructor = Instructor.find_by_email(params[:email])
    customer = Customer.find_by_email(params[:email])


    if customer && customer.authenticate(params[:password])
      session[:customer_id] = customer.id
      redirect_to customer_path(customer.id)
    elsif instructor && instructor.authenticate(params[:password])
      session[:instructor_id] = instructor.id
      redirect_to instructor_path(instructor.id)
    else
      redirect_to login_path, notice: "User not found. Please try again."
    end

  end

  def destroy
    session[:customer_id] = nil
    session[:instructor_id] = nil

    flash[:notice] = "You have successfully logged out."

    redirect_to root_path
  end

  private

    def logged_in?
      (current_customer || current_instructor) ? true : false
    end

end

# customer && customer.authenticate(params[:password])
#   session[:customer_id] = customer.id
#   redirect_to customer_path(customer.id)
