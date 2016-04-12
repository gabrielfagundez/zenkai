class ChangePointsToFloatAgain < ActiveRecord::Migration
  def up
    change_column :tickets, :points, :float
  end

  def down
    change_column :tickets, :points, :float
  end
end
