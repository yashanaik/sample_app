class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :rstid
      t.string :rstname
      t.string :source
      t.string :sdate
      t.integer :trialdays
      t.string :plantype
      t.integer :monthlyrate
      t.boolean :ipadsold
      t.boolean :standsold
      t.integer :ipadrate
      t.integer :standrate
      t.string :rstowner
      t.string :rstaddress
      t.string :rstcity
      t.string :rststate
      t.string :rstzip
      t.integer :rstcontact
      t.integer :rstmgrcontact
      t.string :rstemail
      t.string :paymode
      t.integer :salestax

      t.timestamps
    end
  end
end
