class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.integer :score
    	t.string :content
    	t.string :title
    	t.belongs_to :api
    	t.belongs_to :user
      t.timestamps
    end
  end
end
