class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :description
      t.string :post_type
      t.string :duration
      t.integer :category_id

      t.timestamps
    end
  end
end
