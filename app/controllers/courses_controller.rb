class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]

  def index        
    @ransack_courses = Course.ransack(
      params[:courses_search], search_key: :courses_search)
      
    @courses = @ransack_courses.result.includes(:user)
  end

  def show
  end

  def new
    @course = Course.new
    authorize @course    
  end

  def edit
    authorize @course, :edit?
  end

  def create
    @course = Course.new(course_params)
    authorize @course
    @course.user = current_user

    respond_to do |format|
      if @course.save
        format.html { redirect_to course_url(@course), notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @course, :update?
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to course_url(@course), notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @course
    @course.destroy    

    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_course
      @course = Course.friendly.find(params[:id])
    end
    
    def course_params
      params.require(:course).permit(:title, :description,
                                      :short_description, :price,
                                      :language, :level)
    end
end
