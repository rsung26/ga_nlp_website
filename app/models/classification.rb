class Classification < ActiveRecord::Base
	attr_accessible :classification_type, :result

	belongs_to :text_entry
	
end