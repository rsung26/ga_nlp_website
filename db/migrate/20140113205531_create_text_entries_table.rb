class CreateTextEntriesTable < ActiveRecord::Migration
  def up
  	create_table :text_entries do |t|
  		t.string :title, :default => "untitled"
  		t.text :content, :null => false
  		t.string :source, :null => false
  		t.string :url
  		t.timestamps

  		t.integer :user_id
 	end 
  end

  def down
  	drop_table :text_entries
  end
end
