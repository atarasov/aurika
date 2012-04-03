class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.string :title,                      :limit => 50, :default => '', :null => true
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :news
  end
end
