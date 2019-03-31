class LandingController < ApplicationController
  skip_before_action :authorize

  def home
    @courses = Course.order(created_at: :DESC).limit(1)
    @courseCategories = CourseCategory.all
  end

  def about_us
  end

  def contact
  end

  def courses
  end
end
