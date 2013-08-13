class AddPardetToSalestransactions < ActiveRecord::Migration
  def change
    add_column :salestransactions, :relationship, :string
    add_column :salestransactions, :parentcompany, :string
  end
end
