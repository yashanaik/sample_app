class ModifyDatatypeInSalestransactions < ActiveRecord::Migration
  def change
  	change_column :salestransactions, :salesid, :integer
  	change_column :salestransactions, :parentcompany, :integer
  end
end
