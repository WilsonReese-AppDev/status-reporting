# == Schema Information
#
# Table name: periods
#
#  id            :bigint           not null, primary key
#  start         :datetime
#  end           :datetime
#  reports_count :integer          default(0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require "test_helper"

class PeriodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
