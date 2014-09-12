class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.integer :score
    	t.text :content
    	t.text :title
    	t.belongs_to :api
    	t.belongs_to :user
      t.timestamps
    end
  end
end
