class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
  		t.belongs_to :user
      	t.belongs_to :api
      	t.timestamps
    end
  end
end
