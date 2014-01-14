class CreateClassificationsTable < ActiveRecord::Migration
  def up
  	create_table :classifications do |t|
  		t.string :method, :null => false
  		t.string :result, :null => false
  		t.timestamps

  		t.integer :text_entry_id
  	end
  end

  def down
  	drop_table :classifications
  end
end
