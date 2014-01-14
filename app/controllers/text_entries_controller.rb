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

	
end
