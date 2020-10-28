class RemoveArticleTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :articles
  end

  def down
    create_table :articles do |t|
      t.belongs_to :post
      t.text :content, null: false

      t.timestamps
    end
  end
end
