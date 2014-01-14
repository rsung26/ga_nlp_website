require 'spec_helper'

describe TextEntriesController do

	describe "Given data for a text entry" do
		before do
			@title = "Weather"
			@content = "it's somewhat cold but sunny today."
			@source = "text"

			@user = User.create!(email: "bob@example.com", password: "password")
			login_as(@user)
		end

		describe "when entering the new text entry page" do
			before do
				visit new_text_entry_path
			end

			it "creates a new text entry via a form" do
				fill_in "title", with: @title
				fill_in "content", with: @content
				fill_in "source", with: @source
				click_button "submit"
				current_path.should == text_entries_path
				page.should have_content(@title)
			end


		end

	end
	
end