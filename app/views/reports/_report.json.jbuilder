json.extract! report, :id, :user_id, :period_id, :current_committees_rocks, :future_committees_rocks, :current_internal_support, :future_internal_support, :current_projects, :future_projects, :current_other, :future_other, :pto, :pvt, :ooo, :created_at, :updated_at
json.url report_url(report, format: :json)
