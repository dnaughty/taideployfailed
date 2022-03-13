require "application_system_test_case"

class TeachersTest < ApplicationSystemTestCase
  setup do
    @teacher = teachers(:one)
  end

  test "visiting the index" do
    visit teachers_url
    assert_selector "h1", text: "Teachers"
  end

  test "creating a Teacher" do
    visit teachers_url
    click_on "New Teacher"

    fill_in "Firstn", with: @teacher.firstn
    fill_in "Lastn", with: @teacher.lastn
    fill_in "School", with: @teacher.school_id
    fill_in "Teachnum", with: @teacher.teachnum
    click_on "Create Teacher"

    assert_text "Teacher was successfully created"
    click_on "Back"
  end

  test "updating a Teacher" do
    visit teachers_url
    click_on "Edit", match: :first

    fill_in "Firstn", with: @teacher.firstn
    fill_in "Lastn", with: @teacher.lastn
    fill_in "School", with: @teacher.school_id
    fill_in "Teachnum", with: @teacher.teachnum
    click_on "Update Teacher"

    assert_text "Teacher was successfully updated"
    click_on "Back"
  end

  test "destroying a Teacher" do
    visit teachers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Teacher was successfully destroyed"
  end
end
