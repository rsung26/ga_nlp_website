class HomeController < ApplicationController

	def index
		@text_entries = TextEntry.all

		if current_user
			@user_text_entries = current_user.text_entries
		end
	end

end