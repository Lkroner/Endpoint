class CreateApis < ActiveRecord::Migration
  def change
    create_table :apis do |t|
    	t.string :title
    	t.string :description
    	t.string :tips
    	t.float :averge_score
    	t.string :logo_url
    	t.timestamps
    end
  end
end
