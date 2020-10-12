class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.belongs_to :post

      t.timestamps
    end
  end
end
