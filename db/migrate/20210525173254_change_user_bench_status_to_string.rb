class ChangeUserBenchStatusToString < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :bench_status, :string
  end
end
