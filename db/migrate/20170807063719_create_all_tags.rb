class CreateAllTags < ActiveRecord::Migration[5.0]
  def change
    create_table :all_tags do |t|
      t.string :tag_name
      t.integer :tag_count

      t.timestamps
    end
  end
end
