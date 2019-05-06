class LandingController < ApplicationController
  skip_before_action :authorize

  def home
    @courses = Course.order(created_at: :DESC).limit(6)
    @courseCategories = CourseCategory.all
    @course_members = CourseMember.all
    @featured_courses = Course.order(created_at: :DESC).where(featured: true).limit(2)
    @articles = Lines::Article.published.order(created_at: :DESC).limit(3)
    @first_article = @articles.first
    @other_two_articles = @articles.offset(1).all
  end

  def about_us
  end

  def contact
  end

  def courses
  end
end
