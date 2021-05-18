require "application_system_test_case"

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:one)
  end

  test "visiting the index" do
    visit reports_url
    assert_selector "h1", text: "Reports"
  end

  test "creating a Report" do
    visit reports_url
    click_on "New Report"

    fill_in "Current committees rocks", with: @report.current_committees_rocks
    fill_in "Current internal support", with: @report.current_internal_support
    fill_in "Current other", with: @report.current_other
    fill_in "Current projects", with: @report.current_projects
    fill_in "Future committees rocks", with: @report.future_committees_rocks
    fill_in "Future internal support", with: @report.future_internal_support
    fill_in "Future other", with: @report.future_other
    fill_in "Future projects", with: @report.future_projects
    fill_in "Ooo", with: @report.ooo
    fill_in "Period", with: @report.period_id
    fill_in "Pto", with: @report.pto
    fill_in "Pvt", with: @report.pvt
    fill_in "User", with: @report.user_id
    click_on "Create Report"

    assert_text "Report was successfully created"
    click_on "Back"
  end

  test "updating a Report" do
    visit reports_url
    click_on "Edit", match: :first

    fill_in "Current committees rocks", with: @report.current_committees_rocks
    fill_in "Current internal support", with: @report.current_internal_support
    fill_in "Current other", with: @report.current_other
    fill_in "Current projects", with: @report.current_projects
    fill_in "Future committees rocks", with: @report.future_committees_rocks
    fill_in "Future internal support", with: @report.future_internal_support
    fill_in "Future other", with: @report.future_other
    fill_in "Future projects", with: @report.future_projects
    fill_in "Ooo", with: @report.ooo
    fill_in "Period", with: @report.period_id
    fill_in "Pto", with: @report.pto
    fill_in "Pvt", with: @report.pvt
    fill_in "User", with: @report.user_id
    click_on "Update Report"

    assert_text "Report was successfully updated"
    click_on "Back"
  end

  test "destroying a Report" do
    visit reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Report was successfully destroyed"
  end
end
