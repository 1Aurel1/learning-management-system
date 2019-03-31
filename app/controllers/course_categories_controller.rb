class CourseCategoriesController < ApplicationController
  before_action :set_course_category, only: [:show, :edit, :update, :destroy]

  # GET /course_categories
  def index
    @course_categories = CourseCategory.all
  end

  # GET /course_categories/1
  def show
  end

  # GET /course_categories/new
  def new
    @course_category = CourseCategory.new
  end

  # GET /course_categories/1/edit
  def edit
  end

  # POST /course_categories
  def create
    @course_category = CourseCategory.new(course_category_params)

    if @course_category.save
      flash[:success] = "Course category was NOT successfully created."
    else
      
      render :new, notice: 'Course category was NOT successfully created.'
    end
  end

  # PATCH/PUT /course_categories/1
  def update
    if @course_category.update(course_category_params)
      redirect_to @course_category, notice: 'Course category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /course_categories/1
  def destroy
    @course_category.destroy
    redirect_to course_categories_url, notice: 'Course category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_category
      @course_category = CourseCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def course_category_params
      params.require(:course_category).permit(:name)
    end
end
