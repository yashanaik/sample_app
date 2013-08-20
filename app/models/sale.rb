class Sale < ActiveRecord::Base
	has_many :salestransaction
	has_many :customer
	has_many :parent

	default_scope -> { order('created_at DESC') }
end
