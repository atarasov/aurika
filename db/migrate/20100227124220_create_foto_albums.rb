class CreateFotoAlbums < ActiveRecord::Migration
  def self.up
    create_table :foto_albums do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :foto_albums
  end
end
