class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :salesid
      t.string :spname
      t.string :spcompany
      t.integer :spcomm

      t.timestamps
    end
  end
end
