class CreateParks < ActiveRecord::Migration[6.1]
  def change
    create_table :parks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.text :body, null: false
      t.string :address, null: false
      t.float :latitude, default: 0, null: false
      t.float :longitude, default: 0, null: false
      t.integer :review, default: 0, null: false

      t.timestamps
    end
  end
end
