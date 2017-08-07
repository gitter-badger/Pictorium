class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|
      t.belongs_to :users
      t.belongs_to :posts

      t.timestamps
    end
  end
end
