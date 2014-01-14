class TextEntriesController < ApplicationController

	def index
		@text_entries = TextEntry.all

	end


	def new

	end

	def create
		TextEntry.create(title: params[:title], content: params[:content], source:params[:source])
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
		redirect_to text_entry_path(text_entry)
	end

	def destroy
		TextEntry.delete(params[:id])
		redirect_to text_entries_path	
	end

	
end
