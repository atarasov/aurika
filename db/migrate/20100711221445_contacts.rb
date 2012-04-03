class Contacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
      drop_table :contacts
  end
end
