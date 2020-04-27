class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :rating
      t.integer :review_id
      t.integer :cook_time
      t.text :instructions
      t.string :picture
      t.integer :calories
      t.boolean :gluten_free
      t.boolean :vegetarian
      t.boolean :vegan
      t.boolean :dairy_free

      t.timestamps
    end
  end
end
