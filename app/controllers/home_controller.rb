class HomeController < ApplicationController

	def index

		if current_user
			if current_user.text_entries.empty? 
				redirect_to new_text_entry_path
			else
				@user_text_entries = current_user.text_entries
			end
		else
			redirect_to about_path
		end
	end

	def about

	end

	def contact

	end

end