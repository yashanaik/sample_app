class AddTable37repToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :table37rep, :string
  end
end
