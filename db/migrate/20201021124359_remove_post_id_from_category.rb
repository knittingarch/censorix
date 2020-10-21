class RemovePostIdFromCategory < ActiveRecord::Migration[6.0]
  def change
    remove_column :categories, :post_id, :bigint
  end
end
