require 'test_helper'

class InstructorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @instructor = instructors(:one)
  end

  test "should get index" do
    get instructors_url
    assert_response :success
  end

  test "should get new" do
    get new_instructor_url
    assert_response :success
  end

  test "should create instructor" do
    assert_difference('Instructor.count') do
<<<<<<< HEAD
      post instructors_url, params: { instructor: { email: @instructor.email, first_name: @instructor.first_name, last_name: @instructor.last_name, password_digest: @instructor.password_digest, username: @instructor.username } }
=======
      post instructors_url, params: { instructor: { email: @instructor.email, name: @instructor.name, password_digest: @instructor.password_digest } }
>>>>>>> initial commit
    end

    assert_redirected_to instructor_url(Instructor.last)
  end

  test "should show instructor" do
    get instructor_url(@instructor)
    assert_response :success
  end

  test "should get edit" do
    get edit_instructor_url(@instructor)
    assert_response :success
  end

  test "should update instructor" do
<<<<<<< HEAD
    patch instructor_url(@instructor), params: { instructor: { email: @instructor.email, first_name: @instructor.first_name, last_name: @instructor.last_name, password_digest: @instructor.password_digest, username: @instructor.username } }
=======
    patch instructor_url(@instructor), params: { instructor: { email: @instructor.email, name: @instructor.name, password_digest: @instructor.password_digest } }
>>>>>>> initial commit
    assert_redirected_to instructor_url(@instructor)
  end

  test "should destroy instructor" do
    assert_difference('Instructor.count', -1) do
      delete instructor_url(@instructor)
    end

    assert_redirected_to instructors_url
  end
end
