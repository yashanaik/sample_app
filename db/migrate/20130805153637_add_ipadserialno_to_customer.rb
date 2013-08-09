class AddIpadserialnoToCustomer < ActiveRecord::Migration
  def change
  	add_column :customers, :ipadserialno, :string, default: false
  end
end
