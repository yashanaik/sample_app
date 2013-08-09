class AddFieldnameSdetToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :salesid1, :string
    add_column :customers, :salesid2, :string
    add_column :customers, :source2, :string
    add_column :customers, :commission1, :integer
    add_column :customers, :commission2, :integer
  end
end
