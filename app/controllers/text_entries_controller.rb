class TextEntriesController < ApplicationController

	before_filter :authenticate_user!

	def new

	end

	def create
		if params[:source] == "twitter"
			url = params[:url]
			tweet_id = url.scan(/status\/(.+)/).join

			client = Twitter::REST::Client.new do |config|
			  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
			  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
			  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
			  config.access_token_secret = ENV["TWITTER_ACCESS_SECRET"]
			end

			content = client.status(tweet_id).text
		else
			content = params[:content]
		end

		t = TextEntry.create(title: params[:title], content: content, source:params[:source], url:params[:url])
		current_user.text_entries << t

		redirect_to text_entry_path(t)		
	end


	def show
		@text_entry = TextEntry.find(params[:id])
	end


	def edit
		@text_entry = TextEntry.find(params[:id])
	end

	def update
		text_entry = TextEntry.find(params[:id])
		text_entry.title = params[:title]
		text_entry.source = params[:source]
		text_entry.content = params[:content]
		text_entry.save

		current_user.text_entries << text_entry
		text_entry.classifications.clear

		redirect_to text_entry_path(text_entry)
	end


	def destroy
		TextEntry.delete(params[:id])
		current_user.text_entries.pop

		redirect_to root_path	
	end	
end
