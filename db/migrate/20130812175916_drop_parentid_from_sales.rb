class DropParentidFromSales < ActiveRecord::Migration
  def change
  	remove_column :sales, :parentid, :string
  end
end
