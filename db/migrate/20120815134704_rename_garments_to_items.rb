class RenameGarmentsToItems < ActiveRecord::Migration
  def up
    rename_table :garments, :items
  end

  def down
    rename_table :items, :garments
  end
end
