class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, :null => false
      t.belongs_to :brand, foreign_key: true, index: true
      t.belongs_to :category, foreign_key: true, index: true
      t.decimal :price, :null => false
      t.integer :quantity, :null => false
    end
  end
end
