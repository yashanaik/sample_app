class Salestransaction < ActiveRecord::Base
	has_many :customer
	has_many :sale
	has_many :parent

	default_scope -> { order('updated_at DESC') }

end
