class AddCommsdateToSalestransactions < ActiveRecord::Migration
  def change
    add_column :salestransactions, :commsdate, :string
  end
end
