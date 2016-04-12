class ChangePointsToFloat < ActiveRecord::Migration
  def up
    change_column :user_ticket_estimates, :points, :float
  end

  def down
    change_column :user_ticket_estimates, :points, :float
  end
end
