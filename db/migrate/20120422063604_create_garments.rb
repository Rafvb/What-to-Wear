class CreateGarments < ActiveRecord::Migration
  def change
    create_table :garments do |t|
      t.string :brand
      t.string :description
      t.decimal :price, { precision: 8, scale: 2 }
      t.date :date_bought
      t.integer :user_id

      t.timestamps
    end
    add_index :garments, [:user_id, :date_bought]
  end
end
