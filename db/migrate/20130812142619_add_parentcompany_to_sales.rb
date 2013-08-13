class AddParentcompanyToSales < ActiveRecord::Migration
  def change
    add_column :sales, :parentid, :string
  end
end
