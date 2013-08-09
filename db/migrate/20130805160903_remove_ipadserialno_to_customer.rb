class RemoveIpadserialnoToCustomer < ActiveRecord::Migration
  def change
    remove_column :customers, :ipadserialno, :string
  end
end
