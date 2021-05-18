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
end
