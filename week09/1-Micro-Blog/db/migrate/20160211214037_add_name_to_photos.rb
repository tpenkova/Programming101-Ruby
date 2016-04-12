class AddNameToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :name, :string, null: false, default: "Photo"
  end
end
