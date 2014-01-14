
class TextEntry < ActiveRecord::Base
	attr_accessible :title, :content, :source, :url

	belongs_to :user
	has_many :classifications

end