class CreateApis < ActiveRecord::Migration
  def change
    create_table :apis do |t|
    	t.string :title
    	t.text :description
    	t.string :tips
    	t.float :average_score
    	t.string :logo_url
    	t.timestamps
    end
  end
end
