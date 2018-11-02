require "application_system_test_case"

class CreateCvsTest < ApplicationSystemTestCase
  setup do
    @create_cv = create_cvs(:one)
  end

  test "visiting the index" do
    visit create_cvs_url
    assert_selector "h1", text: "Create Cvs"
  end

  test "creating a Create cv" do
    visit create_cvs_url
    click_on "New Create Cv"

    fill_in "Date Of Birth", with: @create_cv.date_of_birth
    fill_in "Disability", with: @create_cv.disability
    fill_in "Education Type", with: @create_cv.education_type
    fill_in "Gender", with: @create_cv.gender
    fill_in "Id Number", with: @create_cv.id_number
    fill_in "Identification Type", with: @create_cv.identification_type
    fill_in "Passport Number", with: @create_cv.passport_number
    fill_in "Place Of Birth", with: @create_cv.place_of_birth
    click_on "Create Create cv"

    assert_text "Create cv was successfully created"
    click_on "Back"
  end

  test "updating a Create cv" do
    visit create_cvs_url
    click_on "Edit", match: :first

    fill_in "Date Of Birth", with: @create_cv.date_of_birth
    fill_in "Disability", with: @create_cv.disability
    fill_in "Education Type", with: @create_cv.education_type
    fill_in "Gender", with: @create_cv.gender
    fill_in "Id Number", with: @create_cv.id_number
    fill_in "Identification Type", with: @create_cv.identification_type
    fill_in "Passport Number", with: @create_cv.passport_number
    fill_in "Place Of Birth", with: @create_cv.place_of_birth
    click_on "Update Create cv"

    assert_text "Create cv was successfully updated"
    click_on "Back"
  end

  test "destroying a Create cv" do
    visit create_cvs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Create cv was successfully destroyed"
  end
end
