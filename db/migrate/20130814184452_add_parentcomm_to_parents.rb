class AddParentcommToParents < ActiveRecord::Migration
  def change
    add_column :parents, :partentcomm, :integer
  end
end
