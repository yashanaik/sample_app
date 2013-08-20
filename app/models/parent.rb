class Parent < ActiveRecord::Base
	belongs_to :sale
	has_many  :salestransaction
	
	default_scope -> { order('created_at DESC') }
end
