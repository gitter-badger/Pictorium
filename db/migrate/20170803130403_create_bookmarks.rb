class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|
      t.belongs_to :user
      t.belongs_to :post

      t.timestamps
    end
  end
end
