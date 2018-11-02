require 'test_helper'

class CreateCvsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @create_cv = create_cvs(:one)
  end

  test "should get index" do
    get create_cvs_url
    assert_response :success
  end

  test "should get new" do
    get new_create_cv_url
    assert_response :success
  end

  test "should create create_cv" do
    assert_difference('CreateCv.count') do
      post create_cvs_url, params: { create_cv: { date_of_birth: @create_cv.date_of_birth, disability: @create_cv.disability, education_type: @create_cv.education_type, gender: @create_cv.gender, id_number: @create_cv.id_number, identification_type: @create_cv.identification_type, passport_number: @create_cv.passport_number, place_of_birth: @create_cv.place_of_birth } }
    end

    assert_redirected_to create_cv_url(CreateCv.last)
  end

  test "should show create_cv" do
    get create_cv_url(@create_cv)
    assert_response :success
  end

  test "should get edit" do
    get edit_create_cv_url(@create_cv)
    assert_response :success
  end

  test "should update create_cv" do
    patch create_cv_url(@create_cv), params: { create_cv: { date_of_birth: @create_cv.date_of_birth, disability: @create_cv.disability, education_type: @create_cv.education_type, gender: @create_cv.gender, id_number: @create_cv.id_number, identification_type: @create_cv.identification_type, passport_number: @create_cv.passport_number, place_of_birth: @create_cv.place_of_birth } }
    assert_redirected_to create_cv_url(@create_cv)
  end

  test "should destroy create_cv" do
    assert_difference('CreateCv.count', -1) do
      delete create_cv_url(@create_cv)
    end

    assert_redirected_to create_cvs_url
  end
end
