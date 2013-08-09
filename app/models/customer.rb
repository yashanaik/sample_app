class Customer < ActiveRecord::Base

	has_many :salestransaction
	has_many :sale, :through => :salestransaction

	default_scope -> { order('created_at DESC') }

	validates_presence_of :rstid, :rstname, :source, :sdate, :trialdays, :plantype, :monthlyrate, :payfreq, :rstcity, :rststate, :rstaddress, :commission1
	validates :rstid, uniqueness: {:message => "Table37 unique ID has to be unique"}, length: { maximum: 5 , :message => "Table37 unique ID has maximum 5 character"}
	validates :rstname, length: { maximum: 100, :message => "Restaurant Name cannot be more than 100 character" }
	validates_date :sdate, :message => "Date must be in the following mm/dd/yyyy"

end
