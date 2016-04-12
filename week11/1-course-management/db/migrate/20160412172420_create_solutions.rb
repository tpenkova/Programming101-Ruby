class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
    	t.text :body, null: false
    	t.references :task, index: true, null: false, foreign_key: true

    	t.timestamps null: false
    end
  end
end
