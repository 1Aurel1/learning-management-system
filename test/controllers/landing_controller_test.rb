require 'test_helper'

class LandingControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get landing_home_url
    assert_response :success
  end

  test "should get about_us" do
    get landing_about_us_url
    assert_response :success
  end

  test "should get contact" do
    get landing_contact_url
    assert_response :success
  end

  test "should get courses" do
    get landing_courses_url
    assert_response :success
  end

  test "should get blog" do
    get landing_blog_url
    assert_response :success
  end

end
