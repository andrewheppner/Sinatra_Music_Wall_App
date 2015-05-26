class AddUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t| 
      t.references :user
      t.references :track
    end
  end
end