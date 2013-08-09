class Salestransaction < ActiveRecord::Base
	belongs_to :customer
	belongs_to :sale

	default_scope -> { order('created_at DESC') }

end
