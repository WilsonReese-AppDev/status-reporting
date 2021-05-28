# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  bench_status           :string           default("off_bench")
#  user_type              :integer          default("standard")
#  reports_count          :integer          default(0)
#  name                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum bench_status: { on_bench: "On Bench", off_bench: "Off Bench" }
  enum user_type: { admin: 0, standard: 1, support: 2 }

  has_many :reports, dependent: :destroy
  has_many :periods, through: :reports

  def current_report
    return reports.current_report.first
  end
end
