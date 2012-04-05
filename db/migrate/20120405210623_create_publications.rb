class CreatePublications < ActiveRecord::Migration
  def self.up
    create_table :publications do |t|
      t.integer :article_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :publications
  end
end
