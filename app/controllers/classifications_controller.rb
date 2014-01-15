class ClassificationsController < ApplicationController
	
	def create
		datumbox = Datumbox.new(ENV['DATUMBOX_KEY'])

		text_entry = TextEntry.find(params[:text_entry_id])
		method_name = params[:classify_method]
		result = datumbox.send method_name.to_sym, {text: text_entry.content}

		# Write Values to database
		c = Classification.new
		c.method = method_name
		c.result = result
		c.save

		text_entry.classifications << c

		redirect_to text_entry_path(text_entry)
	end

	def destroy
		text_entry = TextEntry.find(params[:text_entry_id])
		
		Classification.delete(params[:id])
		text_entry.classifications.pop

		redirect_to text_entry_path(text_entry)
	end
end