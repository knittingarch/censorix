class AddContentFieldToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :content, :text, default: "", null: false
  end
end
