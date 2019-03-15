class CreateCollectionWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :collection_works do |t|
      t.references :collection, foreign_key: true
      t.references :work, foreign_key: true
      t.text :description
      t.integer :position

      t.timestamps
    end
  end
end
