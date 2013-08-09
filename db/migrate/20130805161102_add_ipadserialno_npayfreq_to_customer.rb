class AddIpadserialnoNpayfreqToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :ipadserialno, :string
    add_column :customers, :payfreq, :integer, default: 30
  end
end
