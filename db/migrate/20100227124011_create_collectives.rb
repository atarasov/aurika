class CreateCollectives < ActiveRecord::Migration
  def self.up
    create_table :collectives do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :collectives
  end
end
