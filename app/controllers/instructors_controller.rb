class InstructorsController < ApplicationController
  before_action :set_instructor, only: [:show, :edit, :update, :destroy]

  before_action :authorize_instructor, except: [:new, :create, :destroy, :index, :show]




  # GET /instructors
  # GET /instructors.json
  def index
    @instructors = Instructor.all
  end

  # GET /instructors/1
  # GET /instructors/1.json
  def show
  end

  # GET /instructors/new
  def new
    @instructor = Instructor.new
  end

  # GET /instructors/1/edit
  def edit
  end

  # POST /instructors
  # POST /instructors.json
  def create
    instructor = Instructor.new(instructor_params)

        if instructor.save
          session[:instructor_id] = instructor.id
          redirect_to instructor_path(instructor.id)
        else
          redirect_to root_path
        end
  end

  # PATCH/PUT /instructors/1
  # PATCH/PUT /instructors/1.json
  def update
    respond_to do |format|
      if @instructor.update(instructor_params)
        format.html { redirect_to @instructor, notice: 'Instructor was successfully updated.' }
        format.json { render :show, status: :ok, location: @instructor }
      else
        format.html { render :edit }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instructors/1
  # DELETE /instructors/1.json
  def destroy
    # if @instructor.destroy
      if @instructor.courses.destroy
      p 'Instructor was successfully destroyed.'
      session[:instructor_id] = nil
      # respond_to do |format|
      #   format.html { redirect_to instructors_url, notice: 'Instructor was successfully destroyed.' }
      #   format.json { head :no_content }
      # end
    end
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instructor
      @instructor = Instructor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instructor_params
      # params.require(:instructor).permit(:name, :email, :password_confirmation)
      params.require(:instructor).permit(:username, :last_name, :first_name, :email, :password, :password_confirmation, :image, :fb_id, :fb_token)

    end
end
