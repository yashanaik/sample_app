class ChangeDatetypeToCustomers < ActiveRecord::Migration
  def change
  	change_column :salestransactions, :sdate, :datetime
  	change_column :customers, :sdate, :datetime
  end
end
