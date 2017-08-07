class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.belongs_to :post
      t.belongs_to :all_tag
      t.string :tag_name

      t.timestamps
    end
  end
end
