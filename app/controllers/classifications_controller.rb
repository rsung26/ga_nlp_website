class ClassificationsController < ApplicationController
	
	def create
		text_entry = TextEntry.find(params[:text_entry_id])
		method_name = params[:classify_method]

		# Check if the text has not already been classifised a certain way
		if Classification.where(text_entry_id: text_entry.id).where(method: method_name).empty?

			datumbox = Datumbox.new(ENV['DATUMBOX_KEY'])

			response = datumbox.send method_name.to_sym, {text: text_entry.content}
			response_parsed = JSON(response)
			result = response_parsed["output"]["result"]

			# Parse ISO language codes
			if method_name == "language_detection"
				result = ISO::Language.find(result).name
			end

			c = Classification.create({method: method_name, result: result})
 			text_entry.classifications << c
		end

		redirect_to text_entry_path(text_entry)
	end

	def destroy
		text_entry = TextEntry.find(params[:text_entry_id])

		Classification.delete(params[:id])
		text_entry.classifications.pop

		redirect_to text_entry_path(text_entry)
	end
end