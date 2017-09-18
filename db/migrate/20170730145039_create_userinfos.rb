class CreateUserinfos < ActiveRecord::Migration[5.0]
  def change
    create_table :userinfos do |t|
      t.belongs_to :user
      t.string :user_name
      t.string :profile
      t.integer :posted_count
      t.integer :bookmark_count

      t.timestamps
    end
  end
end
