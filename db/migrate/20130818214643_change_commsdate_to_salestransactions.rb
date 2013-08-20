class ChangeCommsdateToSalestransactions < ActiveRecord::Migration
  def change
  	change_column :salestransactions, :commsdate, :datetime
  end
end
