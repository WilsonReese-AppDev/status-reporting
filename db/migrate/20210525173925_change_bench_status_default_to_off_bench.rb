class ChangeBenchStatusDefaultToOffBench < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :bench_status, from: nil, to: :off_bench
  end
end
