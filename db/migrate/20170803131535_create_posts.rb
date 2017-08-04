class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.belongs_to :users
      t.string :image
      t.string :tag_name
      t.integer :bookmark_count
      t.integer :comment_count

      t.timestamps
    end
  end
end
