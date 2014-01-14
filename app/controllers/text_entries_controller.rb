class TextEntriesController < ApplicationController

	before_filter :authenticate_user!

	def index
		@text_entries = TextEntry.all
	end

	def new

	end

	def create
		t = TextEntry.create(title: params[:title], content: params[:content], source:params[:source])
		current_user.text_entries << t
		redirect_to text_entries_path		
	end

	def edit
		@text_entry = TextEntry.find(params[:id])
	end

	def show
		@text_entry = TextEntry.find(params[:id])
	end


	def update
		text_entry = TextEntry.find(params[:id])
		text_entry.title = params[:title]
		text_entry.source = params[:source]
		text_entry.content = params[:content]
		text_entry.save

		current_user.text_entries << text_entry

		redirect_to text_entry_path(text_entry)
	end

	def destroy
		TextEntry.delete(params[:id])
		current_user.text_entries.pop
		# Pop off text entry
		redirect_to text_entries_path	
	end
	
end
