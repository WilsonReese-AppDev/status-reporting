require "test_helper"

class ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @report = reports(:one)
  end

  test "should get index" do
    get reports_url
    assert_response :success
  end

  test "should get new" do
    get new_report_url
    assert_response :success
  end

  test "should create report" do
    assert_difference('Report.count') do
      post reports_url, params: { report: { current_committees_rocks: @report.current_committees_rocks, current_internal_support: @report.current_internal_support, current_other: @report.current_other, current_projects: @report.current_projects, future_committees_rocks: @report.future_committees_rocks, future_internal_support: @report.future_internal_support, future_other: @report.future_other, future_projects: @report.future_projects, ooo: @report.ooo, period_id: @report.period_id, pto: @report.pto, pvt: @report.pvt, user_id: @report.user_id } }
    end

    assert_redirected_to report_url(Report.last)
  end

  test "should show report" do
    get report_url(@report)
    assert_response :success
  end

  test "should get edit" do
    get edit_report_url(@report)
    assert_response :success
  end

  test "should update report" do
    patch report_url(@report), params: { report: { current_committees_rocks: @report.current_committees_rocks, current_internal_support: @report.current_internal_support, current_other: @report.current_other, current_projects: @report.current_projects, future_committees_rocks: @report.future_committees_rocks, future_internal_support: @report.future_internal_support, future_other: @report.future_other, future_projects: @report.future_projects, ooo: @report.ooo, period_id: @report.period_id, pto: @report.pto, pvt: @report.pvt, user_id: @report.user_id } }
    assert_redirected_to report_url(@report)
  end

  test "should destroy report" do
    assert_difference('Report.count', -1) do
      delete report_url(@report)
    end

    assert_redirected_to reports_url
  end
end
