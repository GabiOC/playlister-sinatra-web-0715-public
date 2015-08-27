class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :slug, index: true
      t.references :artist, index: true
    end
  end
end
