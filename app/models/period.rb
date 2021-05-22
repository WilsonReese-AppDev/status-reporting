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
class Period < ApplicationRecord
  has_many :reports, dependent: :destroy
  has_many :users, through: :reports

  after_create :create_reports_for_bench_users

  private
      # Create reports for all bench users for a given period
    def create_reports_for_bench_users
      User.on_bench.each do |user|
        user.reports.create!(period: self)
      end
    end
end
