class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.datetime :published_at, default: -> { "now()" }, null: false
      t.string :image_url
      t.string :title, null: false

      t.timestamps
    end
  end
end
