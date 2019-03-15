class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :title
      t.string :artist
      t.integer :year
      t.string :image_url

      t.timestamps
    end
  end
end
