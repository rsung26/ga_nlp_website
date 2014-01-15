class Classification < ActiveRecord::Base
	attr_accessible :method, :result

	belongs_to :text_entry
end