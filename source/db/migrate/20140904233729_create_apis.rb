class CreateApis < ActiveRecord::Migration
  def change
    create_table :apis do |t|
    	t.string :title
    	t.text :description
    	t.string :tips
    	t.float :average_score
    	t.string :logo_url
        t.string :key_required
        t.string :documentation
    	t.timestamps
    end
  end
end
