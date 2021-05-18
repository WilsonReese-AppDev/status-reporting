# == Schema Information
#
# Table name: reports
#
#  id                       :bigint           not null, primary key
#  user_id                  :bigint           not null
#  period_id                :bigint           not null
#  current_committees_rocks :text
#  future_committees_rocks  :text
#  current_internal_support :text
#  future_internal_support  :text
#  current_projects         :text
#  future_projects          :text
#  current_other            :text
#  future_other             :text
#  pto                      :date
#  pvt                      :date
#  ooo                      :date
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
require "test_helper"

class ReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
