class CreateCategoriesPostsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :categories_posts, id: false do |t|
      t.bigint :category_id
      t.bigint :post_id
    end

    add_index :categories_posts, [:category_id, :post_id], unique: true
  end
end
