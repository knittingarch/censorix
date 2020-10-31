class RemoveArticleTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :articles do |t|
      t.belongs_to :post
      t.text :content, null: false

      t.timestamps
    end
  end
end
