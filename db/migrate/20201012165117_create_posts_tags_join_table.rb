class CreatePostsTagsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :posts_tags, id: false do |t|
      t.bigint :post_id
      t.bigint :tag_id
    end

    add_index :posts_tags, :post_id
    add_index :posts_tags, :tag_id
  end
end
