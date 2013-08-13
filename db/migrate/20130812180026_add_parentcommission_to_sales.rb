class AddParentcommissionToSales < ActiveRecord::Migration
  def change
    add_column :sales, :parentcomm, :integer
  end
end
