class ChangeStringFormatInSales < ActiveRecord::Migration
	def change
		change_column :sales, :spcompany, :integer
		remove_column :sales, :salesid, :string
	end
end
