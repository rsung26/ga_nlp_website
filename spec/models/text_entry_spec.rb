require 'spec_helper'

describe TextEntry do

	describe "when given a text entry" do
		before do
			@text_entry = TextEntry.create(title: "window", content: "I like pie.", source: "text")
		end

		describe "when classified" do
			before do
				result = @text_entry.classify("sentiment")
			end

			it "should be created in the database" do
				@classification = Classification.find_by_text_entry_id(@text_entry.id)
				@classification.method.should == "sentiment"
			end


		end


	end

	
end