class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.integer :number
      t.boolean :favorite

      t.timestamps
    end
  end
end
