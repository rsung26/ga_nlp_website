require 'spec_helper'

describe TextEntriesController do

	before do
		@user = User.create!(email: "bob@example.com", password: "password")
		login_as(@user)
	end

	describe "Given data for text entry" do
		before do
			@title = "Weather"
			@content = "it's somewhat cold but sunny today."
			@source = "text"
		end

		describe "when entering the new page" do
			before do
				visit new_text_entry_path
			end

			it "creates a new text entry" do
				fill_in "title", with: @title
				fill_in "content", with: @content
				click_button "submit"
				current_path.should == text_entries_path
				page.should have_content(@title)
			end
		end
	end

	describe "Given a created text entry" do
		before do
			@text_entry = TextEntry.create(title: "window", content: "I like pie.", source: "text")
		end

		describe "when entering the edit page" do
			before do
				visit edit_text_entry_path(@text_entry)
			end

			it "should show the text entry data in the form" do
				find_field("content").value.should == @text_entry.content
			end

			describe "when we finish our edits with the form" do
				before do
					fill_in "content", with: "I like apple pie."
					find_field("content").value.should == "I like apple pie."
					click_button "submit"
					@text_entry.reload
				end

				it "should show the new content" do
					@text_entry.reload
					current_path.should == text_entry_path(@text_entry)
					page.should have_content(@text_entry.content)
				end
			end
		end

		describe "on the index page" do
			before do
				visit text_entries_path
			end

			describe "when clicking the delete button" do
				before do
				  within "tr.text_entry_#{@text_entry.id}" do
                     click_button "DELETE"
                  end
				end

				it "should redirect back to index" do
					current_path.should == text_entries_path
				end

				it "should not have the text entry" do
					page.should_not have_content(@text_entry.title)
				end
			end
		end


	end
	
end