class Parent < ActiveRecord::Base
	has_many :sale
	belongs_to :salestransaction

	default_scope -> { order('created_at DESC') }
end
