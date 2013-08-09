class CreateSalestransactions < ActiveRecord::Migration
  def change
    create_table :salestransactions do |t|
      t.string :sdate
      t.string :table37id
      t.string :salesid
      t.integer :salesamount
      t.integer :salescommission

      t.timestamps
    end
  end
end
