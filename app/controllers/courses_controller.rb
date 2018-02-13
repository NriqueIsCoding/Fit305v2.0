class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  before_action :authorize_user, only: [:show]
  before_action :authorize_instructor, except: [:new, :create, :index, :show, :instructor]

  # GET /courses
  # GET /courses.json

  def full_street_address
    @course = Course.find(params[:id])
    puts "#{address} #{city} #{state} #{zip}"
  end

  def lat
    @course = Course.find(params[:id].latitude.float)
  end

  def lng
    @course = Course.find(params[:id].longitude.float)
  end


  def index
    @courses = Course.all
    @courses = current_instructor.courses if current_instructor
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # def authorize
  # end
  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    respond_to do |format|
      if @course.save
        # byebug
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def instructor

    @instructor = Instructor.find(params[:instructor])

  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
      # p 'Instructor was successfully destroyed.'
      # redirect_to instructor_path(current_instructor)
      # session[:instructor_id] = nil
      respond_to do |format|
        format.html { redirect_to courses_url, notice: 'Customer was successfully destroyed.' }
        format.json { head :no_content }
      end
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params

      params.require(:course).permit(:name, :description, :instructor_id, :image, :fb_id, :fb_token, :date, :price, :address, :city, :state, :zip)

    end
end
