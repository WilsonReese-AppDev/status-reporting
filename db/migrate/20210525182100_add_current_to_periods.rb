class AddCurrentToPeriods < ActiveRecord::Migration[6.1]
  def change
    add_column :periods, :current, :boolean, default: false
  end
end
